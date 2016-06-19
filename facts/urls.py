from django.conf.urls import url
from . import views

app_name = 'facts'

urlpatterns = [
    url(r'', views.ListSongsView.as_view(), name="songlist_for_linkin"),
]