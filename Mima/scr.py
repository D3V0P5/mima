#!/bin/env python3
import lxml.html as s
import requests as r
import MySQLdb
import re
import time
db = MySQLdb.connect("172.17.0.2", "root", "toor", "mima")

for i in range(1, 1400):
#for i in range(80, 86):
    time.sleep(.2)
    page = r.get('http://mima.co.il/fact_page.php?song_id={}'.format(i))
    tree = s.fromstring(page.content)
    song = tree.xpath('//font[@size="+5"]/text()')
    artist = tree.xpath('//font[@size="+2"]/text()')
    facts = tree.xpath('//table[@width="60%"]/tr/td/text()')
    if artist:
        artist=artist[0].replace("'","\"")
        song=song[0].replace("'","\"")
        print(song, artist, facts)
        sql = "INSERT INTO mima.facts_artist (`name`) VALUES ('{!s}') " \
              "ON DUPLICATE KEY UPDATE `name`='{!s}' ".format(artist, artist)
        print(sql)
        cursor = db.cursor()
        cursor.execute(sql)
        db.commit()

        cursor.execute("select id from mima.facts_artist WHERE name='{}'".format(artist))
        arid = cursor.fetchone()[0]
        sql = "INSERT INTO mima.facts_song (`name`,`artist_id` ) VALUES ('{song:s}' , {arid:d}) " \
              "ON DUPLICATE KEY UPDATE `name`='{song:s}' ".format(song=song, arid=arid)

        print(sql)
        cursor.execute(sql)
        db.commit()
        cursor.execute("select id from mima.facts_artist WHERE name='{}'".format(artist))
        soid = cursor.fetchone()[0]
        print(soid)
        for f in facts:
            if re.search('[א-ת]' , f):

                f = f.replace("'","\"")
                f = f.replace("\n"," ")
                f = f.replace("\r"," ")

                sql = "INSERT INTO mima.facts_fact (`content`,`song_id` ) VALUES ('{f:s}' , {soid:d}) " \
                     "ON DUPLICATE KEY UPDATE `content`='{f:s}' ".format(f=f, soid=soid)
                print(sql)
                cursor.execute(sql)
                db.commit()


"""
# Open database connection
db = MySQLdb.connect("172.17.0.2","root","toor","mima" )

# prepare a cursor object using cursor() method

hl = ['א','ב','ג','ד','ה','ו','ז','ח','ט','י','כ','ל','מ','נ','ס','ע','פ','צ','ק','ר','ש','ת']

for i in hl:
    print(i)
    page = r.get('http://mima.co.il/artist_letter.php?let={}'.format(i))
    tree = s.fromstring(page.content)
    txt = tree.xpath('//tr/td/a/text()')
#txt = tree.xpath('//tr/td[!@bgcolor="#EDF3FE"]/a/text()')
    for name in txt[46:]:
        #print("Fuck {}".format(name))
        sql = "INSERT INTO mima.facts_artist (first_name, last_name ) VALUES ('{}' , '{}')".format(name,name)
        print(sql)
        cursor = db.cursor()
        try:
        # Execute the SQL command
            cursor.execute(sql)
        # Commit your changes in the database
            db.commit()
        except:
        # Rollback in case there is any error
            db.rollback()

db.close()
"""

"""
page = r.get('http://mima.co.il/artist_page.php?artist_id=48')
tree = s.fromstring(page.content)
art = tree.xpath('//font[@size="+5"]/text()')
sql = "INSERT INTO mima.facts_artist (first_name, last_name ) VALUES ('{}' , '{}') ON DUPLICATE KEY UPDATE first_name=`{}`".format(art,art,art)
print(sql)
cursor = db.cursor()
try:
    # Execute the SQL command
    cursor.execute(sql)
    # Commit your changes in the database
    db.commit()
    sql = "SELECT id FROM mima.facts_artist WHERE first_name=`{}`".format(art)
    print(sql)
    id = cursor.execute(sql)
    print("the id is {}".format(id))
except:
    # Rollback in case there is any error
    db.rollback()

songs = tree.xpath('//table[@border="0"]/tr/td/a/text()')
print(songs)

"""

db.close()
