from django.core.management.base import BaseCommand, CommandError
import lxml.html as s
import requests as r
import re, time
from facts.models import *

class Command(BaseCommand):
    help = 'Fill the db'

    def handle(self, *args, **options):
        for i in range(1 , 1500): #1 , 1400
            # for i in range(80, 86):
            time.sleep(.3)
            page = r.get('http://www.mima.co.il/fact_page.php?song_id={}'.format(i))
            tree = s.fromstring(page.content)
            song = tree.xpath('//font[@size="+5"]/text()')
            artist = tree.xpath('//font[@size="+2"]/text()')
            facts = tree.xpath('//table[@width="60%"]/tr/td/text()')
            if artist:
                try:
                    ar = Artist.objects.get(name = artist[0])
                except:
                    ar = Artist(name = artist[0])
                ar.save()
                try:
                    so = Song.objects.get(artist = ar , name=song)
                except:
                    so = Song(artist = ar , name = song[0])
                so.save()

                for f in facts:
                    if re.search('[א-ת]', f):
                        try:
                            fa = Fact.objects.get(song = so , content = f)
                        except:
                            fa = Fact(song = so , content = f)
                        print(ar , so , fa)
                        fa.save()
