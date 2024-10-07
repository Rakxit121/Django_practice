from django import forms
from .models import User
import re

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['name', 'address', 'email', 'phone', 'mobile']

    def clean_name(self):
        name = self.cleaned_data.get('name')
        if not re.match("^[A-Za-z ]*$", name):  # Only letters and spaces allowed
            raise forms.ValidationError("Name should not contain numbers or special characters.")
        return name

    def clean_phone(self):
        phone = self.cleaned_data.get('phone')
        if len(phone) != 9 or not phone.isdigit():  # Must be 9 digits
            raise forms.ValidationError("Phone must be exactly 9 digits and all numbers.")
        return phone

    def clean_mobile(self):
        mobile = self.cleaned_data.get('mobile')
        if len(mobile) != 10 or not mobile.isdigit():  # Adjust as necessary
            raise forms.ValidationError("Mobile must be exactly 10 digits and all numbers.")
        return mobile

