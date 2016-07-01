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



class ArtistSerializer(serializers.ModelSerializer):
    class Meta:
        model = Artist
        #fields = ( 'id' , 'name' )
        fields = '__all__'

class SongSerializer(serializers.ModelSerializer):
    class Meta:
        model = Song
        artist = ArtistSerializer()
        #artist = serializers.HyperlinkedRelatedField()
        fields = '__all__'

class FactSerializer(serializers.ModelSerializer):
    class Meta:
        model = Fact
        song = SongSerializer()
        #artist = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
        fields = '__all__'



'''
class ArtistSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Artist
        fields = ( 'id' , 'name' )

class SongSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Song
        #artist = serializers.HyperlinkedRelatedField()
        fields = ( 'id' , 'name' )

class FactSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Fact
        #artist = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
        fields = ('id', 'content')




                #http://stackoverflow.com/questions/29068097/django-rest-framework-lookup-field-through-onetoonefield

'''