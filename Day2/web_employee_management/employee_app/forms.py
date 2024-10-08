# forms.py
from django import forms
from .models import Employee, Qualification, Level

class EmployeeForm(forms.ModelForm):
    class Meta:
        model = Employee
        fields = ['profile_pic', 'name', 'gender', 'phone_number', 'level', 'status', 'qualifications']
        widgets = {
            'qualifications': forms.Select(),
            'status': forms.Select(),
            'level': forms.Select(),
        }
