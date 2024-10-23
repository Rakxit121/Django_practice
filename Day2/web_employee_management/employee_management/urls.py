from django.urls import path
from .views import employee_list, add_employee, edit_employee, delete_employee, add_qualification

urlpatterns = [
    path('', employee_list, name='employee_list'),
    path('add/', add_employee, name='add_employee'),
    path('edit/<int:pk>/', edit_employee, name='edit_employee'),
    path('delete/<int:pk>/', delete_employee, name='delete_employee'),
    path('add-qualification/<int:employee_id>/', add_qualification, name='add_qualification'),
]
