from django.shortcuts import render
from django.http import JsonResponse
from .forms import KalimatiCensusForm, KalankiCensusForm, ChabahilCensusForm, BhaktapurCensusForm
from django.template.loader import render_to_string
import logging

# Set up logging
logger = logging.getLogger(__name__)

def census_form(request):
    if request.method == 'POST':
        logger.info("Received POST data: %s", request.POST)

        location = request.POST.get('location')
        logger.info(f"Received location: {location}")

        
        if location and 'form_html' not in request.POST:  # Handle form rendering
            form = None
            if location == 'Kalimati':
                form = KalimatiCensusForm()
            elif location == 'Kalanki':
                form = KalankiCensusForm()
            elif location == 'Chabahil':
                form = ChabahilCensusForm()
            elif location == 'Bhaktapur':
                form = BhaktapurCensusForm()

            form_html = render_to_string('q5_django/form_template.html', {'form': form}, request=request)
            return JsonResponse({'form_html': form_html})

        # Handle form submission
        form = None
        if location == 'Kalimati':
            form = KalimatiCensusForm(request.POST)
        elif location == 'Kalanki':
            form = KalankiCensusForm(request.POST)
        elif location == 'Chabahil':
            form = ChabahilCensusForm(request.POST)
        elif location == 'Bhaktapur':
            form = BhaktapurCensusForm(request.POST)

        if form and form.is_valid():
            form.save()
            logger.info("Form submitted successfully.")
            return JsonResponse({'status': 'success', 'message': 'Form submitted successfully!'})
        else:
            logger.error("Form validation failed: %s", form.errors)
            errors = form.errors if form else {'location': 'Invalid location selected.'}
            return JsonResponse({'status': 'error', 'errors': errors})

    return render(request, 'q5_django/census_form.html')


    # return render(request, 'q5_django/census_form.html')


            