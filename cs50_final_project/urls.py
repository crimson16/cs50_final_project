from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'cs50_final_project.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    # url(r'^$', views.nation_map, name='nation_map')
    url(r'^maps/', include('maps.urls')),
    url(r'^polls/', include('polls.urls')),
    url(r'^about/', 'cs50_final_project.views.about', name='about'),
    url(r'^admin/', include(admin.site.urls)),
)
