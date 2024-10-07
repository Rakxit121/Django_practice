from django.shortcuts import render, redirect
from .cforms import ContactForm

def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']
            message = form.cleaned_data['message']

            # Example of processing the data
            print(f"Name: {name}")
            print(f"Email: {email}")
            print(f"Message: {message}")

            return redirect('thanks')
    else:
        form = ContactForm()

    return render(request, 'contact.html', {'form': form})
