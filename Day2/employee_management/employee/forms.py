from django import forms
from .models import Employee, Qualification, Level, Salary

class EmployeeForm(forms.ModelForm):
    class Meta:
        model = Employee
        fields = ('name', 'gender', 'phone_no', 'address', 'status', 'start_date', 'level', 'salary', 'qualifications', 'profile_pic')

class QualificationForm(forms.ModelForm):
    class Meta:
        model = Qualification
        fields = ('name', 'institute_name', 'certificates')

class LevelForm(forms.ModelForm):
    class Meta:
        model = Level
        fields = ('level',)

class SalaryForm(forms.ModelForm):
    class Meta:
        model = Salary
        fields = ('salary',)
