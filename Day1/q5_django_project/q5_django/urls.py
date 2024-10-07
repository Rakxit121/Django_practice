from django.urls import path
from .views import census_form  
urlpatterns = [
    path('', census_form, name='census_form'), 
]
