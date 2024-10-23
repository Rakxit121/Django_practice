from django import forms
from .models import Employee, Salary
from qualification_management.models import Qualification

class EmployeeForm(forms.ModelForm):
    class Meta:
        model = Employee
        fields = ['name', 'gender', 'phone_number', 'email', 'address', 'status', 'profile_picture']

class SalaryForm(forms.ModelForm):
    class Meta:
        model = Salary
        fields = ['amount', 'month', 'level']

class QualificationForm(forms.ModelForm):
    class Meta:
        model = Qualification
        fields = ['qualification_name', 'certificate_images', 'institution_name']
