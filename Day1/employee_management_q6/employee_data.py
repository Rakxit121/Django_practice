# employee_data.py

from datetime import datetime

class Employee:
    def __init__(self, first_name, last_name, profile_picture, status, level, qualifications, salary):
        self.first_name = first_name
        self.last_name = last_name
        self.profile_picture = profile_picture
        self.status = status
        self.level = level
        self.qualifications = qualifications
        self.salary = salary
        self.date_added = datetime.now()  # Store the date and time when the employee is added

# List to store employees
employees_list = []
