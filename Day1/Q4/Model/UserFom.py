from django import forms
from .User import User

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['name', 'address', 'email', 'phone', 'mobile']

    def clean_name(self):
        name = self.cleaned_data.get('name')
        if not name.isalpha():
            raise forms.ValidationError("Name must not contain numbers or special characters.")
        return name

    def clean_mobile(self):
        mobile = self.cleaned_data.get('mobile')
        if len(mobile) != 10 or not mobile.isdigit() or not (95 <= int(mobile[:2]) < 100):
            raise forms.ValidationError("Mobile number is invalid.")
        return mobile
