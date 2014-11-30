# 
from django.db import models
from poll.models import SenateStats, PresidentStats, HouseStats


import requests 
from StringIO import StringIO   
# url_str = "http://elections.huffingtonpost.com/pollster/api/charts/?topic=2014-senate"

# pres_url_str = "http://elections.huffingtonpost.com/pollster/api/charts/?topic=2012-president"
url_str = ["http://elections.huffingtonpost.com/pollster/api/charts/?topic=2014-senate", "http://elections.huffingtonpost.com/pollster/api/charts/?topic=2014-house", "http://elections.huffingtonpost.com/pollster/api/charts/?topic=2012-president"]

senate_polls = requests.get(url_str[0]).json()

count = 0
for poll in senate_polls:
    count += 1
    print count
    _num_cand = len(poll["estimates"])

    _rep_name_first = ""
    _rep_name_last = ""
    _rep_val = 0
    _rep_lead_conf = 0
    _dem_name_first = ""
    _dem_name_last = ""
    _dem_val = 0
    _dem_lead_conf = 0
    _ind_name_first = ""
    _ind_name_last = ""
    _ind_val = 0
    _ind_lead_conf = 0
    _incumbent = ""
    
    for person in poll["estimates"]:
        if person['party'] == "Rep":
            _rep_name_first = person["first_name"]
            _rep_name_last = person["last_name"]
            _rep_val = person["value"]
            _rep_lead_conf = person["lead_confidence"]
        elif person['party'] == "Dem":
            _dem_name_first = person["first_name"]
            _dem_name_last = person["last_name"]
            _dem_val = person["value"]
            _dem_lead_conf = person["lead_confidence"]
        else:
            _ind_name_first = person["first_name"]
            _ind_name_last = person["last_name"]
            _ind_val = person["value"]
            _ind_lead_conf = person["lead_confidence"]
        if person["incumbent"] == True:
            _incumbent = person["party"]

    sen_obj = SenateStats(election_date = poll["election_date"],
                    last_updated = "logs",
                    poll_count = poll["poll_count"],
                    short_title = poll["short_title"],
                    slug = poll["slug"],
                    state = poll["state"],
                    title = poll["title"],
                    topic = poll["topic"],
                    url = poll["url"],
                    num_cand = _num_cand,
                    rep_name_first = _rep_name_first,
                    rep_name_last = _rep_name_last,
                    rep_val = _rep_val,
                    rep_lead_conf = _rep_lead_conf,
                    dem_name_first = _dem_name_first,
                    dem_name_last = _dem_name_last,
                    dem_val = _dem_val,
                    dem_lead_conf = _dem_lead_conf,
                    ind_name_first = _ind_name_first,
                    ind_name_last = _ind_name_last,
                    ind_val = _ind_val,
                    ind_lead_conf = _ind_lead_conf,
                    incumbent = _incumbent)
    try:
        sen_obj.save()
        pass
    except Exception, e:
        raise e
        print "fuck"


house_polls = requests.get(url_str[1]).json()
for poll in house_polls:
    count += 1
    print count
    _num_cand = len(poll["estimates"])

    _rep_name_first = ""
    _rep_name_last = ""
    _rep_val = 0
    _rep_lead_conf = 0
    _dem_name_first = ""
    _dem_name_last = ""
    _dem_val = 0
    _dem_lead_conf = 0
    _ind_name_first = ""
    _ind_name_last = ""
    _ind_val = 0
    _ind_lead_conf = 0
    _incumbent = ""
    
    for person in poll["estimates"]:
        if person['party'] == "Rep":
            _rep_name_first = person["first_name"]
            _rep_name_last = person["last_name"]
            _rep_val = person["value"]
            _rep_lead_conf = person["lead_confidence"]
        elif person['party'] == "Dem":
            _dem_name_first = person["first_name"]
            _dem_name_last = person["last_name"]
            _dem_val = person["value"]
            _dem_lead_conf = person["lead_confidence"]
        else:
            _ind_name_first = person["first_name"]
            _ind_name_last = person["last_name"]
            _ind_val = person["value"]
            _ind_lead_conf = person["lead_confidence"]
        if person["incumbent"] == True:
            _incumbent = person["party"]

    house_obj = HouseStats(election_date = poll["election_date"],
                    last_updated = "logs",
                    poll_count = poll["poll_count"],
                    short_title = poll["short_title"],
                    slug = poll["slug"],
                    state = poll["state"],
                    title = poll["title"],
                    topic = poll["topic"],
                    url = poll["url"],
                    num_cand = _num_cand,
                    rep_name_first = _rep_name_first,
                    rep_name_last = _rep_name_last,
                    rep_val = _rep_val,
                    rep_lead_conf = _rep_lead_conf,
                    dem_name_first = _dem_name_first,
                    dem_name_last = _dem_name_last,
                    dem_val = _dem_val,
                    dem_lead_conf = _dem_lead_conf,
                    ind_name_first = _ind_name_first,
                    ind_name_last = _ind_name_last,
                    ind_val = _ind_val,
                    ind_lead_conf = _ind_lead_conf,
                    incumbent = _incumbent)
    try:
        house_obj.save()
        pass
    except Exception, e:
        raise e
        print "fuck"


pres_polls = requests.get(url_str[2]).json()
for poll in pres_polls:
    count += 1
    print count
    _num_cand = len(poll["estimates"])

    _rep_name_first = ""
    _rep_name_last = ""
    _rep_val = 0
    _rep_lead_conf = 0
    _dem_name_first = ""
    _dem_name_last = ""
    _dem_val = 0
    _dem_lead_conf = 0
    _ind_name_first = ""
    _ind_name_last = ""
    _ind_val = 0
    _ind_lead_conf = 0
    _incumbent = ""
    
    for person in poll["estimates"]:
        if person['party'] == "Rep":
            _rep_name_first = person["first_name"]
            _rep_name_last = person["last_name"]
            _rep_val = person["value"]
            _rep_lead_conf = person["lead_confidence"]
        elif person['party'] == "Dem":
            _dem_name_first = person["first_name"]
            _dem_name_last = person["last_name"]
            _dem_val = person["value"]
            _dem_lead_conf = person["lead_confidence"]
        else:
            _ind_name_first = person["first_name"]
            _ind_name_last = person["last_name"]
            _ind_val = person["value"]
            _ind_lead_conf = person["lead_confidence"]
        if person["incumbent"] == True:
            _incumbent = person["party"]

    pres_obj = PresidentStats(election_date = poll["election_date"],
                    last_updated = "logs",
                    poll_count = poll["poll_count"],
                    short_title = poll["short_title"],
                    slug = poll["slug"],
                    state = poll["state"],
                    title = poll["title"],
                    topic = poll["topic"],
                    url = poll["url"],
                    num_cand = _num_cand,
                    rep_name_first = _rep_name_first,
                    rep_name_last = _rep_name_last,
                    rep_val = _rep_val,
                    rep_lead_conf = _rep_lead_conf,
                    dem_name_first = _dem_name_first,
                    dem_name_last = _dem_name_last,
                    dem_val = _dem_val,
                    dem_lead_conf = _dem_lead_conf,
                    ind_name_first = _ind_name_first,
                    ind_name_last = _ind_name_last,
                    ind_val = _ind_val,
                    ind_lead_conf = _ind_lead_conf,
                    incumbent = _incumbent)
    try:
        pres_obj.save()
        pass
    except Exception, e:
        raise e
        print "fuck"