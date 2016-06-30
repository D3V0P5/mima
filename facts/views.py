from django.shortcuts import render
from django.http import HttpResponse

from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from facts.serializers import UserSerializer, GroupSerializer, SongSerializer , ArtistSerializer , FactSerializer

from . import models
# Create your views here.



from django.views.generic import ListView , DetailView


class ListSongsView(ListView):
    model = models.Song
    #template_name = 'facts/index.html'
    #paginate_by = 10

    def get_context_data(self, **kwargs):
        context = super(ListSongsView, self).get_context_data(**kwargs)
        context['artist'] = models.Artist.objects.all() #.order_by('first_name')
        return context


class SongDetailView(DetailView):
    model = models.Song



class ListAllView(ListView):
    model = models.Song
    template_name = 'facts/index.html'

    def get_context_data(self, **kwargs):
        context = super(ListAllView, self).get_context_data(**kwargs)
        context['artist'] = models.Artist.objects.all() #.order_by('first_name')
        return context


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer

class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer


class ArtistViewSet(viewsets.ModelViewSet):
    queryset = models.Artist.objects.all()
    serializer_class = ArtistSerializer

class SongViewSet(viewsets.ModelViewSet):
    queryset = models.Song.objects.all()
    serializer_class = SongSerializer

class FactViewSet(viewsets.ModelViewSet):
    queryset = models.Fact.objects.all()
    serializer_class = FactSerializer


#https://select2.github.io/examples.html
#http://selectize.github.io/selectize.js/

        #        def get_context_data(self, **kwargs):
#            context = super(IndexView, self).get_context_data(**kwargs)
#            context['roles'] = Role.objects.all()
#            context['venue_list'] = Venue.objects.all()
#            context['festival_list'] = Festival.objects.all()
#            # And so on for more models
#            return context


# def get_context_data(self, **kwargs):
#     d = super().get_context_data(**kwargs)
#     d['title123'] = self.object.title
#     return d
#http://stackoverflow.com/questions/31133963/multiple-models-generic-listview-to-template