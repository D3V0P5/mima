from django.db import models


# Create your models here.


class Artist(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)


class Song(models.Model):
    artist = models.ForeignKey(Artist, on_delete=models.CASCADE)
    name = models.CharField(max_length=30, db_index=True)
    release_date = models.DateField(db_index=True)
    # num_stars = models.IntegerField()


# https://docs.djangoproject.com/en/1.9/ref/models/fields/#slugfield

class Fact(models.Model):
    #artist = models.ForeignKey(Artist, on_delete=models.CASCADE)
    song = models.ForeignKey(Song, on_delete=models.CASCADE)
    fact = models.TextField()
