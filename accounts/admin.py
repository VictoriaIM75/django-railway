from django.contrib import admin

# Register your models here.
from .models import *
from .models import Pregunta, Opcion, Participante, Respuesta

admin.site.register(Customer)
admin.site.register(Product)
admin.site.register(Tag)
admin.site.register(Order)


admin.site.register(Pregunta)
admin.site.register(Opcion)
admin.site.register(Participante)
admin.site.register(Respuesta)