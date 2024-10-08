# admin.py
from django.contrib import admin
from .models import Employee, Level, Qualification

@admin.register(Employee)
class EmployeeAdmin(admin.ModelAdmin):
    list_display = ['name', 'gender', 'phone_number', 'level', 'status']
    search_fields = ['name', 'phone_number']
    list_filter = ['status', 'level']

@admin.register(Level)
class LevelAdmin(admin.ModelAdmin):
    list_display = ['name', 'salary']

@admin.register(Qualification)
class QualificationAdmin(admin.ModelAdmin):
    list_display = ['name', 'certificate']
