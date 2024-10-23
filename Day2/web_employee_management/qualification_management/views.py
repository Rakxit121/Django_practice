# # qualification_management/views.py
# from django.shortcuts import render, redirect, get_object_or_404
# from .models import Qualification
# from .forms import QualificationForm

# def add_qualification(request):
#     if request.method == 'POST':
#         form = QualificationForm(request.POST, request.FILES)
#         if form.is_valid():
#             form.save()
#             return redirect('qualification_list')  # Redirect to the qualification list
#     else:
#         form = QualificationForm()
#     return render(request, 'qualification_management/add_qualification.html', {'form': form})

# def edit_qualification(request, pk):
#     qualification = get_object_or_404(Qualification, pk=pk)
#     if request.method == 'POST':
#         form = QualificationForm(request.POST, request.FILES, instance=qualification)
#         if form.is_valid():
#             form.save()
#             return redirect('qualification_list')  # Redirect to the qualification list
#     else:
#         form = QualificationForm(instance=qualification)
#     return render(request, 'qualification_management/edit_qualification.html', {'form': form})

# def delete_qualification(request, pk):
#     qualification = get_object_or_404(Qualification, pk=pk)
#     if request.method == 'POST':
#         qualification.delete()
#         return redirect('qualification_list')  # Redirect to the qualification list
#     return render(request, 'qualification_management/delete_qualification.html', {'qualification': qualification})

# def qualification_list(request):
#     qualifications = Qualification.objects.all()
#     return render(request, 'qualification_management/qualification_list.html', {'qualifications': qualifications})
