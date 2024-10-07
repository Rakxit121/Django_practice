from django.db import models

# Base class
class CensusData(models.Model):
    age = models.IntegerField()
    gender = models.CharField(max_length=10, choices=[('Male', 'Male'), ('Female', 'Female'), ('Other', 'Other')])

    class Meta:
        abstract = True

class KalimatiCensus(CensusData):
    location = models.CharField(default='Kalimati', max_length=100)

class KalankiCensus(CensusData):
    location = models.CharField(default='Kalanki', max_length=100)

class ChabahilCensus(CensusData):
    location = models.CharField(default='Chabahil', max_length=100)

class BhaktapurCensus(CensusData):
    location = models.CharField(default='Bhaktapur', max_length=100)
