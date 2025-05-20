from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Customer(models.Model): 
    name = models.CharField(max_length=200, null=True) 
    phone = models. CharField(max_length=200, null=True) 
    email = models. CharField(max_length=200, null=True) 
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return self.name


class Tag(models.Model): 
    name = models.CharField(max_length=200, null=True) 

    def __str__(self):
        return self.name
    


class Product(models.Model):
    CATEGORY = (
        ('Indoor', 'Indoor'),
        ('Out Door', 'Out Door'),
        
    )
    name = models.CharField(max_length=200, null=True)
    price = models.FloatField(null=True)
    category = models.CharField(max_length=200, null=True, choices = CATEGORY)
    description = models.CharField(max_length=200, null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)
    tags = models.ManyToManyField(Tag)
    
    def __str__(self):
        return self.name
    


class Order(models.Model):
    STATUS = (
        ('Pending', 'Pending'),
        ('Out for delivery', 'Out for delivery'),
        ('Delivered', 'Delivered'),
    )
    customer =models.ForeignKey(Customer, null= True, on_delete=models.SET_NULL)
    product = models.ForeignKey(Product, null=True, on_delete=models.SET_NULL )
    date_created = models.DateTimeField(auto_now_add=True, null=True)
    status = models.CharField(max_length=200, null=True, choices = STATUS)
    note = models.CharField(max_length=1000, null=True)

    def __str__(self):
        return self.product.name
    


CATEGORIAS = [
    ('Etapa 1', 'Etapa 1'),
    ('Etapa 2', 'Etapa 2'),
    ('Etapa 3', 'Etapa 3'),
    ('Etapa 4', 'Etapa 4'),
    ('Etapa 5', 'Etapa 5'),
]

class Pregunta(models.Model):
    texto = models.CharField(max_length=300)
    categoria = models.CharField(max_length=20, choices=CATEGORIAS)

    def __str__(self):
        return f"{self.categoria} - {self.texto}"

class Opcion(models.Model):
    pregunta = models.ForeignKey(Pregunta, on_delete=models.CASCADE, related_name='opciones')
    texto = models.CharField(max_length=200)
    es_correcta = models.BooleanField(default=False)

    def __str__(self):
        return self.texto

class Participante(models.Model):
    nombre = models.CharField(max_length=100)
    materia = models.CharField(max_length=100)
    fecha = models.DateField()
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    def __str__(self):
        return self.nombre

class Respuesta(models.Model):
    participante = models.ForeignKey(Participante, on_delete=models.CASCADE)
    pregunta = models.ForeignKey(Pregunta, on_delete=models.CASCADE)
    opcion_elegida = models.ForeignKey(Opcion, on_delete=models.CASCADE)
    es_correcta = models.BooleanField()
    def __str__(self):
        return self.participante.nombre + " - " + self.pregunta.texto
    


class Resultado(models.Model):
    participante = models.OneToOneField(Participante, on_delete=models.CASCADE)
    fecha = models.DateTimeField(auto_now=True)
    puntaje_total = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return f"{self.participante.nombre} - {self.puntaje_total}%"
