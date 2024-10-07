from django.shortcuts import render, redirect
from django.http import JsonResponse
from .form import KalimatiCensusForm, KalankiCensusForm, ChabahilCensusForm, BhaktapurCensusForm

def census_form(request):
    if request.method == 'POST':
        location = request.POST.get('location')  
        form = None

        # Select the appropriate form based on the location
        if location == 'Kalimati':
            form = KalimatiCensusForm(request.POST)
        elif location == 'Kalanki':
            form = KalankiCensusForm(request.POST)
        elif location == 'Chabahil':
            form = ChabahilCensusForm(request.POST)
        elif location == 'Bhaktapur':
            form = BhaktapurCensusForm(request.POST)

        # Process the form data if a valid form is found
        if form and form.is_valid():
            form.save()
            return JsonResponse({'status': 'success', 'message': 'Form submitted successfully!'})
        else:
            return JsonResponse({'status': 'error', 'errors': form.errors if form else 'Invalid location selected.'})

    # For GET requests, return the initial form page (or handle differently if required)
    return render(request, 'census_form.html', {'form': None})  # Fixed template path
