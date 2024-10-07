from django.db import models

class User(models.Model):
    name = models.CharField(max_length=100)
    address = models.TextField()
    email = models.EmailField()
    phone = models.CharField(max_length=9)
    mobile = models.CharField(max_length=10)

