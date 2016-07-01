from django.conf.urls import url, include
from rest_framework import routers

from . import views

app_name = 'facts'

router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'groups', views.GroupViewSet)
router.register(r'songs' , views.SongViewSet)
router.register(r'Artists' , views.ArtistViewSet)
router.register(r'Facts',views.FactViewSet)


urlpatterns = [
    url(r'^api/', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')) ,
    url(r'^song/(?P<pk>\d+)/$' , views.SongDetailView.as_view(), name="song_detail") ,
    url(r'^artists$' , views.ListArtistsView.as_view(), name="song_detail") ,
    url(r'^artist/(?P<pk>\d+)/$' , views.ArtistDetailView.as_view(), name="artist_detail") ,
    url(r'^$', views.ListArtistsView.as_view(template_name="facts/artist_list.html")) , #, name="songlist_for_linkin"),

]
