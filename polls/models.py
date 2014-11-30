from django.db import models


# Create your models here.
# class SenatePoll(models.Model):

#     question = models.CharField(max_length=200)
#     election_date = models.DateTimeField('date published')
#     state = models.CharField(max_length=20)



class SenateStats(models.Model):
    # poll = models.ForeignKey('polls.SenatePoll', related_name = 'stats')
    # percent_lead = models.DecimalField(max_digits=5, decimal_places = 3, blank=True, null=True, help_text="Lead Percent")
    # votes = models.IntegerField(default=0)
    # republican = models.CharField(max_length=200)
    # democrat = models.CharField(max_length=200)
    # other = models.CharField(max_length=200)
    # url = models.CharField(max_length=200)
    election_date = models.CharField(max_length=200, blank=True, null=True)
    last_updated = models.CharField(max_length=200, blank=True, null=True)
    poll_count = models.IntegerField(default=0, blank=True, null=True)
    short_title = models.CharField(max_length=200, blank=True, null=True)
    slug = models.CharField(max_length=200, blank=True, null=True)
    state = models.CharField(max_length=200, blank=True, null=True)
    title = models.CharField(max_length=200, blank=True, null=True)
    topic = models.CharField(max_length=200, blank=True, null=True)
    title = models.CharField(max_length=200, blank=True, null=True)
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




