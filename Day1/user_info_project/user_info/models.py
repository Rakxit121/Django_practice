from django.db import models

# Create your models here.


class User(models.Model):
    name = models.CharField(max_length=100)
    address = models.TextField()
    email = models.EmailField()
    phone = models.CharField(max_length=9)  # Should be numeric
    mobile = models.CharField(max_length=15)  # Change as per requirement
