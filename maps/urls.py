from django.conf.urls import patterns, url

from maps import views

urlpatterns = patterns('',
url(r'^$', views.nation_map, name='nation_map'),
url(r'^dem_rank', views.dem_rank, name='dem_rank'),
url(r'^rep_rank', views.rep_rank, name='rep_rank'),
url(r'^(?P<state_abbrev>[a-zA-Z0-9]{2})/$', views.state_data, name="state_data"),
)