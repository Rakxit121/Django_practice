from django.shortcuts import render, redirect, get_object_or_404
from .models import Employee, Level, Salary, Qualification
from .forms import EmployeeForm, QualificationForm

def employee_list(request):
    employees = Employee.objects.all()
    return render(request, 'view_employees.html', {'employees': employees})

def add_employee(request):
    if request.method == 'POST':
        employee_form = EmployeeForm(request.POST, request.FILES)
        if employee_form.is_valid():
            employee = employee_form.save()
            # Handling qualifications (optional)
            qualifications = request.POST.getlist('qualifications')  # Example to capture qualifications if needed
            for qual_id in qualifications:
                employee.qualifications.add(Qualification.objects.get(id=qual_id))
            return redirect('view_employees')
    else:
        employee_form = EmployeeForm()
    return render(request, 'add_employee.html', {'employee_form': employee_form})

def update_employee(request, pk):
    employee = get_object_or_404(Employee, pk=pk)
    if request.method == 'POST':
        employee_form = EmployeeForm(request.POST, request.FILES, instance=employee)
        if employee_form.is_valid():
            employee_form.save()
            return redirect('view_employees')
    else:
        employee_form = EmployeeForm(instance=employee)
    return render(request, 'edit_employee.html', {'employee_form': employee_form})

def delete_employee(request, pk):
    employee = get_object_or_404(Employee, pk=pk)
    employee.delete()
    return redirect('view_employees')
