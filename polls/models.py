from django.db import models

# This contains all our data fields

class SenateStats(models.Model):

    election_date = models.CharField(max_length=200, blank=True, null=True)
    last_updated = models.CharField(max_length=200, blank=True, null=True)
    poll_count = models.IntegerField(default=0, blank=True, null=True)
    short_title = models.CharField(max_length=200, blank=True, null=True)
    slug = models.CharField(max_length=200, blank=True, null=True)
    state = models.CharField(max_length=200, blank=True, null=True)
    title = models.CharField(max_length=200, blank=True, null=True)
    topic = models.CharField(max_length=200, blank=True, null=True)
    # title = models.CharField(max_length=200, blank=True, null=True)
    url = models.CharField(max_length=200, blank=True, null=True)
    num_cand = models.IntegerField(default=0, blank=True, null=True)

    rep_name_first = models.CharField(max_length=200, blank=True, null=True)
    rep_name_last = models.CharField(max_length=200, blank=True, null=True)
    rep_val = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)
    rep_lead_conf = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)

    dem_name_first = models.CharField(max_length=200, blank=True, null=True)
    dem_name_last = models.CharField(max_length=200, blank=True, null=True)
    dem_val = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)
    dem_lead_conf = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)

    ind_name_first = models.CharField( default = "", max_length=200, blank=True, null=True)
    ind_name_last = models.CharField(default = "", max_length=200, blank=True, null=True)
    ind_val = models.DecimalField(default = 0, decimal_places=3, max_digits= 6, blank=True, null=True)
    ind_lead_conf = models.DecimalField(default = 0, decimal_places=3, max_digits= 6, blank=True, null=True)
    incumbent = models.CharField(default = "", max_length=200, blank=True, null=True)

class HouseStats(models.Model):

    election_date = models.CharField(max_length=200, blank=True, null=True)
    last_updated = models.CharField(max_length=200, blank=True, null=True)
    poll_count = models.IntegerField(default=0, blank=True, null=True)
    short_title = models.CharField(max_length=200, blank=True, null=True)
    slug = models.CharField(max_length=200, blank=True, null=True)
    state = models.CharField(max_length=200, blank=True, null=True)
    #Abbreviations

    title = models.CharField(max_length=200, blank=True, null=True)
    topic = models.CharField(max_length=200, blank=True, null=True)
    #title = models.CharField(max_length=200, blank=True, null=True)
    #THIS was done twice in the senate model! Will it cause a problem??
    url = models.CharField(max_length=200, blank=True, null=True)
    num_cand = models.IntegerField(default=0, blank=True, null=True)
    #not in poll data but is it just the number of canidates?

    rep_name_first = models.CharField(max_length=200, blank=True, null=True)
    rep_name_last = models.CharField(max_length=200, blank=True, null=True)
    rep_val = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)
    rep_lead_conf = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)


    dem_name_first = models.CharField(max_length=200, blank=True, null=True)
    dem_name_last = models.CharField(max_length=200, blank=True, null=True)
    dem_val = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)
    dem_lead_conf = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)

    ind_name_first = models.CharField( default = "", max_length=200, blank=True, null=True)
    ind_name_last = models.CharField(default = "", max_length=200, blank=True, null=True)
    ind_val = models.DecimalField(default = 0, decimal_places=3, max_digits= 6, blank=True, null=True)
    ind_lead_conf = models.DecimalField(default = 0, decimal_places=3, max_digits= 6, blank=True, null=True)
    incumbent = models.CharField(default = "", max_length=200, blank=True, null=True)


class PresidentElection(models.Model):
    state = models.CharField(max_length=200, blank=True, null=True)
    dem_electoral = models.IntegerField(default=0, blank=True, null=True)
    rep_electoral = models.IntegerField(default=0, blank=True, null=True)
    dem_num = models.IntegerField(default=0, blank=True, null=True)
    rep_num = models.IntegerField(default=0, blank=True, null=True)
    other_num = models.IntegerField(default=0, blank=True, null=True)
    total_num = models.IntegerField(default=0, blank=True, null=True)
    rep_pct = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)
    dem_pct = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)
    other_pct = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)
    
        



class PresidentStats(models.Model):
    state = models.CharField(max_length=200, blank=True, null=True)
    dem_electoral = models.IntegerField(default=0, blank=True, null=True)
    rep_electoral = models.IntegerField(default=0, blank=True, null=True)
    dem_num = models.IntegerField(default=0, blank=True, null=True)
    rep_num = models.IntegerField(default=0, blank=True, null=True)
    other_num = models.IntegerField(default=0, blank=True, null=True)
    total_num = models.IntegerField(default=0, blank=True, null=True)
    rep_pct = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)
    dem_pct = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)
    other_pct = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)

    election_date = models.CharField(max_length=200, blank=True, null=True)
    last_updated = models.CharField(max_length=200, blank=True, null=True)
    poll_count = models.IntegerField(default=0, blank=True, null=True)
    short_title = models.CharField(max_length=200, blank=True, null=True)
    slug = models.CharField(max_length=200, blank=True, null=True)
    state = models.CharField(max_length=200, blank=True, null=True)
    #Abbreviations

    title = models.CharField(max_length=200, blank=True, null=True)
    topic = models.CharField(max_length=200, blank=True, null=True)
    #title = models.CharField(max_length=200, blank=True, null=True)
    #THIS was done twice in the senate model! Will it cause a problem??
    url = models.CharField(max_length=200, blank=True, null=True)
    num_cand = models.IntegerField(default=0, blank=True, null=True)
    #not in poll data but is it just the number of canidates?

    rep_name_first = models.CharField(max_length=200, blank=True, null=True)
    rep_name_last = models.CharField(max_length=200, blank=True, null=True)
    rep_val = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)
    rep_lead_conf = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)


    dem_name_first = models.CharField(max_length=200, blank=True, null=True)
    dem_name_last = models.CharField(max_length=200, blank=True, null=True)
    dem_val = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)
    dem_lead_conf = models.DecimalField(decimal_places=3, max_digits= 6, blank=True, null=True)

    ind_name_first = models.CharField( default = "", max_length=200, blank=True, null=True)
    ind_name_last = models.CharField(default = "", max_length=200, blank=True, null=True)
    ind_val = models.DecimalField(default = 0, decimal_places=3, max_digits= 6, blank=True, null=True)
    ind_lead_conf = models.DecimalField(default = 0, decimal_places=3, max_digits= 6, blank=True, null=True)
    incumbent = models.CharField(default = "", max_length=200, blank=True, null=True)
    




