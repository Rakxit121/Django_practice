# employee/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.employee_list, name='employee_list'),  # Main employee list page
    path('add/', views.add_employee, name='add_employee'),  # Add employee page
    path('edit/<int:employee_id>/', views.edit_employee, name='edit_employee'),  # Edit employee
    path('delete/<int:employee_id>/', views.delete_employee, name='delete_employee'),  # Delete employee
]
