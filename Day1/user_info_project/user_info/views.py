from django.shortcuts import render
from django.views import View
from .forms import UserForm

class UserView(View):
    def get(self, request):
        form = UserForm()
        return render(request, 'user_info/form.html', {'form': form})

    def post(self, request):
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'user_info/success.html', {'form': form})
        return render(request, 'user_info/form.html', {'form': form})
