
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
import simplejson as json


def nation_map(request):
    from polls.models import PresidentElection
    # get the models from the data base and order alphabetically
    results = PresidentElection.objects.all().order_by("state")
    return render(request, 'map_base.html')

def dem_rank(request):
    from polls.models import PresidentElection
    dem_vals = {value: key for value, key in list(PresidentElection.objects.values_list("state", "dem_pct" ))}
    return HttpResponse(json.dumps(dem_vals,use_decimal=True), mimetype='application/json')

def rep_rank(request):
    from polls.models import PresidentElection
    rep_vals = {value: key for value, key in list(PresidentElection.objects.values_list("state", "rep_pct" ))}   
    return HttpResponse(json.dumps(rep_vals,use_decimal=True), mimetype='application/json')

def state_data(request, state_abbrev):
    from polls.models import PresidentElection

    rets = PresidentElection.objects.filter(state=state_abbrev)[0]

    new = {"data": [rets.dem_pct, rets.dem_num, rets.rep_pct, rets.rep_num, rets.other_pct]}
    return HttpResponse(json.dumps(new,use_decimal=True), mimetype='application/json')
