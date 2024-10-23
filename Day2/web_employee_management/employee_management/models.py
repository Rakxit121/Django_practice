from django.db import models

class Employee(models.Model):
    STATUS_CHOICES = [
        ('present', 'Present'),
        ('absent', 'Absent'),
        ('active', 'Active'),
        ('terminated', 'Terminated')
    ]

    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)
    phone_number = models.CharField(max_length=15)
    address = models.TextField()
    status = models.CharField(max_length=10, choices=STATUS_CHOICES)
    profile_picture = models.ImageField(upload_to='profiles/')
    start_date = models.DateField(auto_now_add=True)
    end_date = models.DateField(null=True, blank=True)

    def __str__(self):
        return self.name

class Level(models.Model):
    level_number = models.IntegerField()

    def __str__(self):
        return f"Level {self.level_number}"

class Salary(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    month = models.DateField()
    level = models.ForeignKey(Level, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.employee.name} - {self.amount}"
