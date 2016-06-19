# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-06-19 11:56
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Artist',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=30)),
                ('last_name', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Fact',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fact', models.TextField()),
                ('artist', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='facts.Artist')),
            ],
        ),
        migrations.CreateModel(
            name='Song',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(db_index=True, max_length=30)),
                ('release_date', models.DateField(db_index=True)),
                ('artist', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='facts.Artist')),
            ],
        ),
        migrations.AddField(
            model_name='fact',
            name='song',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='facts.Song'),
        ),
    ]
