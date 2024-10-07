# employee_data.py

class Employee:
    def __init__(self, first_name, last_name, profile_picture, status, level, qualifications, salary):
        self.first_name = first_name
        self.last_name = last_name
        self.profile_picture = profile_picture
        self.status = status
        self.level = level
        self.qualifications = qualifications
        self.salary = salary

# List to store employees
employees_list = []
