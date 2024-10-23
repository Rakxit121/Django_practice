from django.db import models

class Level(models.Model):
    level = models.IntegerField(unique=True)

    def __str__(self):
        return str(self.level)

class Salary(models.Model):
    salary = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return str(self.salary)

class Qualification(models.Model):
    name = models.CharField(max_length=255)
    institute_name = models.CharField(max_length=255)
    certificates = models.ImageField(upload_to='certificates/')

    def __str__(self):
        return self.name

class Employee(models.Model):
    name = models.CharField(max_length=255)
    gender = models.CharField(max_length=10)
    phone_no = models.CharField(max_length=20)
    address = models.TextField()
    status = models.CharField(max_length=20)
    start_date = models.DateField()
    end_date = models.DateField(null=True, blank=True)
    level = models.ForeignKey(Level, on_delete=models.CASCADE)
    salary = models.ForeignKey(Salary, on_delete=models.CASCADE)
    qualifications = models.ManyToManyField(Qualification)
    profile_pic = models.ImageField(upload_to='profile_pics/')

    def __str__(self):
        return self.name
