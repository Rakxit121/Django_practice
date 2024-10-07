from django.http import JsonResponse;
from django.shortcuts import render;
from ..Model.UserFom import UserForm;

def add_user(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse({'status': 'error', 'errors': form.errors})
    return render(request, 'add_user.html')
