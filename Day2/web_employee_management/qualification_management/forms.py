from django import forms
from .models import Qualification

class QualificationForm(forms.ModelForm):
    class Meta:
        model = Qualification
        fields = ['qualification_name', 'certificate_images', 'institution_name']
