from django.urls import path
from .view import census_form  
urlpatterns = [
    path('', census_form, name='census_form'), 
]
