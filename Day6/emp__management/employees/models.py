from django.db import models

class Employee(models.Model):
    name = models.CharField(max_length=255)
    employee_id = models.CharField(max_length=50)
    gender = models.IntegerField(choices=[(1, 'Male'), (2, 'Female')])
    phone = models.CharField(max_length=15)
    email = models.EmailField(unique=True)
    status = models.IntegerField(choices=[(1, 'Active'), (2, 'Terminated')])
    qualification = models.CharField(max_length=255)
    profile_image = models.ImageField(upload_to='profiles/', null=True, blank=True)

    def __str__(self):
        return self.name
