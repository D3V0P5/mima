from django.db import models
from datetime import datetime

# Create your models here.


class Artist(models.Model):
    name = models.CharField(max_length=30, db_index=True , unique=True)
   # last_name = models.CharField(max_length=30, default="")
    def __str__(self):
        return self.name


class Song(models.Model):
    artist = models.ForeignKey(Artist, on_delete=models.CASCADE, related_name="songs")
    name = models.CharField(max_length=30, db_index=True)
    #release_date = models.DateField(db_index=True , default=datetime.now)
    # num_stars = models.IntegerField()

    def __str__(self):  #
        return self.name

# https://docs.djangoproject.com/en/1.9/ref/models/fields/#slugfield


class Fact(models.Model):
    # artist = models.ForeignKey(Artist, on_delete=models.CASCADE)
    song = models.ForeignKey(Song, on_delete=models.CASCADE, related_name="facts") # for the template related_name="facts"
    content = models.TextField(default="")
    def __str__(self):
        return self.content
