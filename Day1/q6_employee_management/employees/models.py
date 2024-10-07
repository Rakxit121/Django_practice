from django.db import models

# Employee Model
class Employee(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    profile_picture = models.ImageField(upload_to='profiles/')
    status_choices = [('Present', 'Present'), ('Absent', 'Absent'), ('Active', 'Active'), ('Terminated', 'Terminated')]
    status = models.CharField(max_length=10, choices=status_choices, default='Active')

    def __str__(self):
        return f'{self.first_name} {self.last_name}'

# Level Model
class Level(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    level_name = models.CharField(max_length=20)

    def __str__(self):
        return self.level_name

# Salary Model
class Salary(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    level = models.ForeignKey(Level, on_delete=models.CASCADE)
    salary_amount = models.DecimalField(max_digits=10, decimal_places=2)
    month = models.DateField()

    def __str__(self):
        return f'{self.salary_amount} for {self.month}'

# Qualification Model
class Qualification(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    qualification_name = models.CharField(max_length=100)
    certificate = models.FileField(upload_to='certificates/')

    def __str__(self):
        return self.qualification_name
