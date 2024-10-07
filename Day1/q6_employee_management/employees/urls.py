from django.urls import path
from . import views

urlpatterns = [
    path('', views.employee_list, name='employee_list'),  # List employees
    path('add/', views.add_employee, name='add_employee'),  # Add a new employee
    path('terminate/', views.terminate_employee, name='terminate_employee'),  # Terminate an employee (via AJAX)
    
    # path('update/<int:id>/', views.update_employee, name='update_employee'),  # Update employee
    # path('delete/<int:id>/', views.delete_employee, name='delete_employee'),  # Delete employee
]
