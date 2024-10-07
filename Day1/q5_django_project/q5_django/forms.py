from django import forms
from .models import KalimatiCensus, KalankiCensus, ChabahilCensus, BhaktapurCensus  # Corrected 'model' to 'models'

class KalimatiCensusForm(forms.ModelForm):
    class Meta:
        model = KalimatiCensus
        fields = ['age', 'gender']

class KalankiCensusForm(forms.ModelForm):
    class Meta:
        model = KalankiCensus
        fields = ['age', 'gender']

class ChabahilCensusForm(forms.ModelForm):
    class Meta:
        model = ChabahilCensus
        fields = ['age', 'gender']

class BhaktapurCensusForm(forms.ModelForm):
    class Meta:
        model = BhaktapurCensus
        fields = ['age', 'gender']
