from django.shortcuts import render


from . import models
# Create your views here.
from django.views.generic import ListView


class ListSongsView(ListView):
    model = models.Song
# template_name = 'dashboard.html'

    def get_context_data(self, **kwargs):
        context = super(ListSongsView, self).get_context_data(**kwargs)
        context['artist'] = models.Artist.objects.all() #.order_by('first_name')
        return context
#paginate_by = 10






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