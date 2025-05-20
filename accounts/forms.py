from django.forms import ModelForm
from .models import Order
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django import forms    
from django.contrib.auth.models import User, Group

class OrderForm(ModelForm):
    class Meta:
        model = Order
        fields = '__all__' ###['customer','product', 'date_created', 'status' ]  


class CreateUserForm(UserCreationForm):
    group = forms.ModelChoiceField(
        queryset=Group.objects.all(),
        required=True,
        empty_label="Selecciona un grupo"
    )

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2', 'group']




class CustomUserChangeForm(UserChangeForm):
    group = forms.ModelChoiceField(
        queryset=Group.objects.all(),
        required=True,
        empty_label="Selecciona un grupo"
    )
    password = forms.CharField(
        label="Nueva contraseña",
        widget=forms.PasswordInput,
        required=False
    )

    class Meta:
        model = User
        fields = ['username', 'email', 'password', 'group']

    def __init__(self, *args, **kwargs):
        super(CustomUserChangeForm, self).__init__(*args, **kwargs)

        # Inicializar grupo actual
        if self.instance and self.instance.pk:
            groups = self.instance.groups.all()
            if groups.exists():
                self.fields['group'].initial = groups.first()

    def save(self, commit=True):
        user = super().save(commit=False)

        # Cambiar contraseña si se ingresó una nueva
        new_password = self.cleaned_data.get('password')
        if new_password:
            user.set_password(new_password)

        if commit:
            user.save()
            group = self.cleaned_data['group']
            user.groups.set([group])
            user.save()

        return user
