from django.db import models

class Level(models.Model):
    name = models.CharField(max_length=50)
    salary = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f'{self.name} - {self.salary}'

class Qualification(models.Model):
    name = models.CharField(max_length=100)
    certificate = models.FileField(upload_to='certificates/')

    def __str__(self):
        return self.name

class Employee(models.Model):
    STATUS_CHOICES = [
        ('present', 'Present'),
        ('absent', 'Absent'),
        ('active', 'Active'),
        ('terminated', 'Terminated')
    ]

    profile_pic = models.ImageField(upload_to='profile_pics/')
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)
    phone_number = models.CharField(max_length=10)
    level = models.ForeignKey(Level, on_delete=models.CASCADE)
    qualifications = models.ManyToManyField(Qualification)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES)

    def __str__(self):
        return self.name
