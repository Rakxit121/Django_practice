from django.shortcuts import render, redirect
from django.http import JsonResponse
from .models import Employee, Level, Salary, Qualification
from django.core.exceptions import ObjectDoesNotExist
from .forms import EmployeeForm

# View for displaying employees
def employee_list(request):
    employees = Employee.objects.all()
    return render(request, 'employees/employee_list.html', {'employees': employees})

# View for adding employee
def add_employee(request):
    if request.method == 'POST':
        form = EmployeeForm(request.POST, request.FILES)
        if form.is_valid():
            try:
                form.save()
                return redirect('employee_list')
            except Exception as e:
                return JsonResponse({'error': str(e)})
    else:
        form = EmployeeForm()
    return render(request, 'employees/add_employee.html', {'form': form})




from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def terminate_employee(request):
    if request.method == 'POST':
        try:
            employee_id = request.POST.get('employee_id')
            employee = Employee.objects.get(id=employee_id)
            employee.status = 'Terminated'
            employee.save()
            return JsonResponse({'message': 'Employee terminated successfully'})
        except ObjectDoesNotExist:
            return JsonResponse({'error': 'Employee not found'})
        except Exception as e:
            return JsonResponse({'error': str(e)})

