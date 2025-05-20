import django_filters
from django_filters import DateFilter, CharFilter
from django.contrib.auth.models import User

from .models import *



class OrderFilter(django_filters.FilterSet):
    start_date =  DateFilter(field_name="date_created", lookup_expr = 'gte')
    end_date =  DateFilter(field_name="date_created", lookup_expr = 'lte')
    note = CharFilter(field_name="note", lookup_expr = 'icontains')
    class Meta:
        model = Order
        fields = '__all__'
        exclude = ['customer', 'date_created']

class UserFilter(django_filters.FilterSet):
    username = django_filters.CharFilter(
        field_name='username',
        lookup_expr='istartswith',
        label='Nombre de usuario'
    )

    class Meta:
        model = User
        fields = ['username']