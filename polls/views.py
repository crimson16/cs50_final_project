from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.db import models
from polls.models import HouseStats
import json

def senate_polls(request):
    from polls.models import SenateStats

    # get the models from the data base and order alphabetically
    senate_polls = SenateStats.objects.all().exclude(short_title = "NH Senate: Bass vs. Shaheen").order_by("state")
    return render(request, 'poll_table.html', {"poll_array" : senate_polls, "poll_type": "Senate"})

def house_polls(request):
    from polls.models import HouseStats
    # get the models from the data base and order alphabetically
    house_polls = HouseStats.objects.all().order_by("state")
    return render(request, 'poll_table.html', {"poll_array" : house_polls, "poll_type": "Major House"})

def president_polls(request):
    from polls.models import PresidentElection
    # get the models from the data base and order alphabetically
    results = PresidentElection.objects.all().order_by("state")
    return render(request, 'pres_polls.html', {"elect_results" : results})