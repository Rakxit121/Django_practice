from django.db import models
from employee_management.models import Employee

class Qualification(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    qualification_name = models.CharField(max_length=100)
    certificate_images = models.ImageField(upload_to='certificates/')
    institution_name = models.CharField(max_length=100)

    def __str__(self):
        return self.qualification_name
