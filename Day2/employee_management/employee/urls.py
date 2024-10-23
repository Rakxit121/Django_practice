from django.urls import path
from . import views

urlpatterns = [
    path('add_employee/', views.add_employee, name='add_employee'),
    path('view_employees/', views.employee_list, name='view_employees'),
    path('edit_employee/<int:pk>/', views.update_employee, name='edit_employee'),
    path('delete_employee/<int:pk>/', views.delete_employee, name='delete_employee'),
]
