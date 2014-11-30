
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
# from django.views.decorators.cache import cache_page
import json

def home(request):

    # from app.geography.models import Nation, NationalStats, State, StateStats, District, DistrictStats, CensusTract, CensusTractStats, DistrictVisData
    # #state_ids = State.objects.all().ordered_by('pk').values_list('state_id', flat =True)
    # from app.person.models import Person
    
    # people = Person.objects.filter(current = True)
    # states = State.objects.all().order_by("name")

    # districts_list = District.objects.all()

    # # states = states.order_by("name")

    return render(request, 'home_page.html')
def about(request):

    return render(request, 'about_us.html')