from rest_framework import serializers
from .models import Employee

class EmployeeSerializer(serializers.ModelSerializer):
    profile_image = serializers.ImageField(max_length=None, use_url=True)

    class Meta:
        model = Employee
        fields = '__all__'
