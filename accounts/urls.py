from django.urls import path


from . import views

urlpatterns = [
    path('login/', views.loginPage, name="login"),
    path('logout/', views.logoutUser, name="logout"),
    path('register/', views.registerPage, name="register"),
    path('', views.home, name="home"),
    path('', views.inicio, name="inicio"),
    path('datosSensores/', views.datosSensores, name="datosSensores"),


    path('user/', views.userPage, name="user_page"),
    path('usuarios/', views.usuariosPage, name='usuarios_page'),
    path('editar_usuario/<int:pk>/', views.update_user, name='update_user'),

    path('eliminar_usuario/<int:pk>/', views.delete_user, name='delete_user'),

    path('servicio/', views.servicioPage, name="servicio_page"),

    path('products/', views.products, name="products"),
    path('customer/<str:pk_test>/', views.customer, name = "customer"),
    path('create_order/<str:pk>', views.createOrder, name = "create_order"),
    path('update_order/<str:pk>', views.updateOrder, name = "update_order"),
    path('delete_order/<str:pk>', views.deleteOrder, name = "delete_order"),



    path('iniciar/', views.iniciar_quiz, name='iniciar_quiz'),
    path('quiz/<int:participante_id>/', views.quiz, name='quiz'),  # <-- esto es necesario
    path('resultados/<int:participante_id>/', views.resultados, name='resultados'),
    path('editar/', views.ingresar_contraseña, name='ingresar_contraseña'),
    path('resultadostodos/', views.ingresar_contraseñaresultados, name='ingresar_contraseñaresultados'),

    path('editar_quiz/', views.editar_quiz, name='editar_quiz'),
    path('resultados_todos/', views.resultados_todos, name='resultados_todos'),
    path('actualizar_datos', views.actualizar_datos, name='actualizar_datos'),
    path('api/datos_sensores', views.api_datos_sensores, name='api_datos_sensores'),


]
