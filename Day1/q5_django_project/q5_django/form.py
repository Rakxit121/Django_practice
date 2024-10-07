from django import forms
from .model import KalimatiCensus, KalankiCensus, ChabahilCensus, BhaktapurCensus

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
