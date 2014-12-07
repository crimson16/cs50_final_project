from django.conf.urls import patterns, url

from polls import views

urlpatterns = patterns('',
    url(r'^senate', views.senate_polls, name='senate_polls'),
    url(r'^house', views.house_polls, name='house_polls'),
    url(r'^president', views.president_polls, name='president_polls'),
)




# urlpatterns = patterns('',
    
#     # index / dashboard
#     url(r'^$', views.geographic_profile, name='geographic_profile'),
#     url(r'data/(?P<state_abbrev>[a-zA-Z0-9]{2})/(?P<district_num>\d+)/$', views.district_data, name="district_data"),
#     url(r'data/(?P<state_abbrev>[a-zA-Z0-9]{2})/$', views.state_data, name="state_data"),
#     url(r'compare/state/(?P<stat_name>[a-zA-Z_0-9]+)/$', views.compare_state_data, name="compare_state_data"), 
#     url(r'compare/district/(?P<stat_name>[a-zA-Z_0-9]+)/$', views.compare_district_data, name="compare_district_data"), 
#     url(r'compare/$', views.geographic_comparisons, name='geographic_comparisons'),


# )