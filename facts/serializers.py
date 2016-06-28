from django.contrib.auth.models import User, Group
from .models import Song,Fact,Artist
from rest_framework import serializers


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'groups')


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ('url', 'name')

class ArtistSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Artist
        fields = '__all__'

class SongSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Song
        #fields = ( 'name' , 'release_date' , 'id')
        fields = '__all__'

class FactSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Fact
        fields = '__all__'
