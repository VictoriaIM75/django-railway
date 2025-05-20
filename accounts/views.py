from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from django.forms import inlineformset_factory
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .models import *
from .decorators import unauthenticated_user, allowed_users, admin_only
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import Group
from .models import *
from .forms import OrderForm, CreateUserForm, CustomUserChangeForm
from django.views.decorators.csrf import csrf_protect
from .models import Pregunta, Opcion
from .filters import OrderFilter, UserFilter
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserChangeForm
import requests  # Para hacer la solicitud al ESP32

# Create your views here.
from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
import json

# Variables para mantener los últimos valores recibidos
datos_sensores = {
    "flujo": "0.00",
    "conductividad": "0",
    "burbuja": "No Detectada",
    "mensaje1": "------------"
}

# Variable global para almacenar el último comando
ultimo_comando = ""


@allowed_users(allowed_roles=['administrador'])

def registerPage(request):
    form = CreateUserForm()
    if request.method == "POST":
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')
            selected_group = form.cleaned_data.get('group')

            selected_group.user_set.add(user)  # Añade el usuario al grupo

            messages.success(request, 'Account was created for ' + username)
            return redirect('usuarios_page')
    context = {'form': form}
    return render(request, 'accounts/register.html', context)


@unauthenticated_user
def loginPage(request):

    if request.method =="POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username = username, password = password)

        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.info(request, 'Usuario o contraseña incorrectos')
    context = {}
    return render(request, 'accounts/login.html', context)


def logoutUser(request):
    logout(request)
    return redirect('login')

@login_required(login_url='login')
def home(request):
    orders = Order.objects.all()
    customers = Customer.objects.all()


    total_customers = customers.count()
    total_orders = orders.count()
    delivered = orders.filter(status = 'Delivered').count()
    pending = orders.filter(status = 'Pending').count()


    context = {
        'orders' : orders,
        'customers' : customers,
        'total_customers' :  total_customers,
        'total_orders' : total_orders,
        'delivered' : delivered,
        'pending' : pending, 

    }
    return render(request, 'accounts/inicio.html', context)

@login_required(login_url='login')
def userPage(request):
    context = {}
    return render(request, 'accounts/user.html', context)



@login_required(login_url='login')
def datosSensores(request):
    context = {}
    return render(request, 'accounts/datosSensores.html', context)

@login_required(login_url='login')
def servicioPage(request):
    context = {}
    return render(request, 'accounts/servicio.html', context)

@login_required(login_url='login')
def products(request):
    products =  Product.objects.all()

    return render(request, 'accounts/products.html',{
        'products' : products
    })

@login_required(login_url='login')
def customer(request, pk_test):
    customer = Customer.objects.get(id=pk_test)


    orders = customer.order_set.all()
    orders_count = orders.count()


    myFilter = OrderFilter(request.GET, queryset = orders)
    orders = myFilter.qs

    context = {
        'customer' : customer,
        'orders' : orders,
        'orders_count' : orders_count,
        'myFilter' : myFilter,

    }



    return render(request, 'accounts/customer.html', context)

@login_required(login_url='login')
def createOrder(request,pk):
    OrderFormSet = inlineformset_factory(Customer, Order, fields=('product', 'status'), extra=5)
    customer = Customer.objects.get(id=pk)
    formset = OrderFormSet(queryset=Order.objects.none(), instance=customer)
    # form = OrderForm(initial = {'customer': customer})
    if request.method == 'POST':
        #print('Printing POST:', request.POST)
        #form = OrderForm(request.POST)
        formset = OrderFormSet(request.POST, instance=customer)
        if formset.is_valid():
            formset.save()
            return redirect('/')
    context = {'formset' : formset}
    return render(request, 'accounts/order_form.html', context)

@login_required(login_url='login')
def updateOrder(request, pk):

    order= Order.objects.get(id=pk)
    form = OrderForm(instance=order)

    if request.method == 'POST':
        #print('Printing POST:', request.POST)
        form = OrderForm(request.POST, instance=order)
        if form.is_valid():
            form.save()
            return redirect('/')
    context = {
        'form' : form, 
         }
    return render(request, 'accounts/order_form.html', context)

@login_required(login_url='login')
def deleteOrder(request,pk):
    order = Order.objects.get(id=pk)
    if request.method == "POST":
        order.delete()
        return redirect ('/')
    context = {
        'item' : order,
    }
    return render(request, 'accounts/delete.html', context)

@login_required
def update_user(request, pk):
    user = get_object_or_404(User, pk=pk)
    form = CustomUserChangeForm(request.POST or None, instance=user)

    if form.is_valid():
        form.save()
        return redirect('usuarios_page')  # O la página a la que quieres volver

    return render(request, 'accounts/user_form.html', {'form': form})

@login_required(login_url='login')
def delete_user(request, pk):
    user = User.objects.get(id=pk)
    if request.method == 'POST':
        user.delete()
        return redirect('usuarios_page')
    context = {'item': user}
    return render(request, 'accounts/deleteUser.html', context)

@login_required(login_url='login')
def usuariosPage(request):
    users = User.objects.all()
    myFilter = UserFilter(request.GET, queryset=users)
    users = myFilter.qs

    context = {
        'users': users,
        'myFilter': myFilter,
    }
    return render(request, 'accounts/usuarios.html', context)



def iniciar_quiz(request):
    if request.method == 'POST':
        nombre = request.POST['nombre']
        materia = request.POST['materia']
        fecha = request.POST['fecha']
        participante = Participante.objects.create(
            nombre=nombre,
            materia=materia,
            fecha=fecha,
            usuario=request.user
        )
        return redirect('quiz', participante_id=participante.id)
    return render(request, 'accounts/iniciar_quiz.html')



def quiz(request, participante_id):
    participante = Participante.objects.get(id=participante_id)
    categorias = CATEGORIAS
    preguntas_por_categoria = {
        cat[0]: Pregunta.objects.filter(categoria=cat[0]) for cat in categorias
    }
    if request.method == 'POST':
        for key, value in request.POST.items():
            if key.startswith('pregunta_'):
                pregunta_id = int(key.split('_')[1])
                opcion = Opcion.objects.get(id=int(value))
                pregunta = Pregunta.objects.get(id=pregunta_id)
                Respuesta.objects.create(
                    participante=participante,
                    pregunta=pregunta,
                    opcion_elegida=opcion,
                    es_correcta=opcion.es_correcta
                )
        return redirect('resultados', participante_id=participante.id)
    return render(request, 'accounts/quiz.html', {
        'participante': participante,
        'preguntas_por_categoria': preguntas_por_categoria
    })

def resultados(request, participante_id):
    participante = Participante.objects.get(id=participante_id)
    respuestas = Respuesta.objects.filter(participante=participante)
    resumen = {}
    total_correctas = 0
    for cat, _ in CATEGORIAS:
        respuestas_cat = respuestas.filter(pregunta__categoria=cat)
        correctas = respuestas_cat.filter(es_correcta=True).count()
        total = respuestas_cat.count()
        porcentaje = round((correctas / total) * 100, 2) if total > 0 else 0
        resumen[cat] = {
            'correctas': correctas,
            'incorrectas': total - correctas,
            'puntaje': porcentaje
        }
        total_correctas += correctas
    total_preguntas = respuestas.count()
    puntaje_total = round((total_correctas / total_preguntas) * 100, 2) if total_preguntas > 0 else 0

    return render(request, 'accounts/resultados.html', {
        'participante': participante,
        'resumen': resumen,
        'puntaje_total': puntaje_total
    })

@login_required
def ingresar_contraseña(request):
    if request.method == 'POST':
        password = request.POST['password']
        user = authenticate(username=request.user.username, password=password)
        if user is not None:
            return redirect('editar_quiz')
        else:
            return render(request, 'accounts/ingresar_contraseña.html', {'error': 'Contraseña incorrecta'})
    return render(request, 'accounts/ingresar_contraseña.html')


@login_required
def ingresar_contraseñaresultados(request):
    if request.method == 'POST':
        password = request.POST['password']
        user = authenticate(username=request.user.username, password=password)
        if user is not None:
            return redirect('resultados_todos')
        else:
            return render(request, 'accounts/ingresar_contraseña.html', {'error': 'Contraseña incorrecta'})
    return render(request, 'accounts/ingresar_contraseña.html')


@csrf_protect
@login_required
def editar_quiz(request):
    if request.method == "POST":
        accion = request.POST.get('accion')

        if accion == "crear":
            texto_pregunta = request.POST.get("texto_pregunta")
            categoria = request.POST.get("categoria")
            opcion_correcta = int(request.POST.get("opcion_correcta"))

            nueva_pregunta = Pregunta.objects.create(texto=texto_pregunta, categoria=categoria)

            for i in range(1, 5):
                texto_op = request.POST.get(f"opcion_{i}")
                es_correcta = (i == opcion_correcta)
                Opcion.objects.create(pregunta=nueva_pregunta, texto=texto_op, es_correcta=es_correcta)

            return redirect("editar_quiz")

        elif accion == "editar":
            pregunta_id = request.POST.get("pregunta_id")
            texto_pregunta = request.POST.get("texto_pregunta")
            categoria = request.POST.get("categoria")
            opcion_correcta_id = request.POST.get("opcion_correcta")

            pregunta = Pregunta.objects.get(id=pregunta_id)
            pregunta.texto = texto_pregunta
            pregunta.categoria = categoria
            pregunta.save()

            for opcion in pregunta.opciones.all():
                nuevo_texto = request.POST.get(f"opcion_{opcion.id}")
                opcion.texto = nuevo_texto
                opcion.es_correcta = (str(opcion.id) == opcion_correcta_id)
                opcion.save()

            return redirect("editar_quiz")

        elif accion == "añadir_opcion":
            pregunta_id = request.POST.get("pregunta_id")
            texto_opcion = request.POST.get("texto_opcion")
            es_correcta = request.POST.get("es_correcta") == "on"  # Checkbox enviado o no

            pregunta = Pregunta.objects.get(id=pregunta_id)

            if es_correcta:
                # Desmarcar otras opciones
                pregunta.opciones.update(es_correcta=False)

            # Crear nueva opción
            nueva_opcion = Opcion.objects.create(
                pregunta=pregunta,
                texto=texto_opcion,
                es_correcta=es_correcta
            )

            return redirect("editar_quiz")

        elif accion == "eliminar":
            pregunta_id = request.POST.get("pregunta_id")
            Pregunta.objects.filter(id=pregunta_id).delete()
            return redirect("editar_quiz")

    preguntas = Pregunta.objects.prefetch_related('opciones').all()
    etapas = ["Etapa 1", "Etapa 2", "Etapa 3", "Etapa 4", "Etapa 5"]

    return render(request, 'accounts/editar_quiz.html', {
        'preguntas': preguntas,
        'etapas': etapas
    })



@login_required
def resultados(request, participante_id):
    participante = get_object_or_404(Participante, id=participante_id)
    respuestas = Respuesta.objects.filter(participante=participante)

    CATEGORIAS = [
        ('Etapa 1', 'Etapa 1'),
        ('Etapa 2', 'Etapa 2'),
        ('Etapa 3', 'Etapa 3'),
        ('Etapa 4', 'Etapa 4'),
        ('Etapa 5', 'Etapa 5'),
    ]

    resumen = {}
    total_correctas = 0
    total_preguntas = respuestas.count()

    for cat, _ in CATEGORIAS:
        respuestas_cat = respuestas.filter(pregunta__categoria=cat)
        correctas = respuestas_cat.filter(es_correcta=True).count()
        total_cat = respuestas_cat.count()
        porcentaje_cat = round((correctas / total_cat) * 100, 2) if total_cat > 0 else 0

        resumen[cat] = {
            'correctas': correctas,
            'incorrectas': total_cat - correctas,
            'puntaje': porcentaje_cat,
        }

        total_correctas += correctas

    puntaje_total = round((total_correctas / total_preguntas) * 100, 2) if total_preguntas > 0 else 0

    # Guardar o actualizar resultado general
    Resultado.objects.update_or_create(
        participante=participante,
        defaults={'puntaje_total': puntaje_total},
    )

    return render(request, 'accounts/resultados.html', {
        'participante': participante,
        'resumen': resumen,
        'puntaje_total': puntaje_total,
    })



@login_required
def resultados_todos(request):
    resultados = Resultado.objects.select_related('participante').order_by('-fecha')
    return render(request, 'accounts/resultados_todos.html', {'resultados': resultados})





@csrf_exempt
def recibir_comando(request):
    global ultimo_comando
    if request.method == "POST":
        comando = request.POST.get("comando")
        if comando:
            ultimo_comando = comando
            return JsonResponse({"status": "ok", "comando": comando})
        else:
            return JsonResponse({"status": "error", "mensaje": "Comando no proporcionado"})
    return JsonResponse({"status": "error", "mensaje": "Método no permitido"})

def enviar_comando_esp32(request):
    global ultimo_comando
    comando = ultimo_comando
    ultimo_comando = ""  # Se borra luego de enviar para evitar repeticiones
    return JsonResponse({"comando": comando})

@csrf_exempt
def actualizar_datos(request):
    if request.method == "POST":
        try:
            data = json.loads(request.body.decode("utf-8"))

            datos_sensores["flujo"] = data.get("flujo", "0.00")
            datos_sensores["conductividad"] = data.get("conductividad", "0")
            datos_sensores["burbuja"] = data.get("burbuja", "No Detectada")
            datos_sensores["mensaje1"] = data.get("mensaje1", "------------")

            return JsonResponse({"status": "ok", "mensaje": "Datos recibidos correctamente."})

        except json.JSONDecodeError:
            return JsonResponse({"status": "error", "mensaje": "JSON inválido."})
    else:
        return JsonResponse({"status": "error", "mensaje": "Método no permitido."})

# Vista que consulta los datos en tiempo real
def api_datos_sensores(request):
    return JsonResponse(datos_sensores)