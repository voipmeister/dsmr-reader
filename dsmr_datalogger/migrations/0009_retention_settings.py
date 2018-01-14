# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-10-19 18:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dsmr_datalogger', '0008_dsmrreading_help_text'),
    ]

    operations = [
        migrations.CreateModel(
            name='RetentionSettings',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_retention_in_hours', models.IntegerField(blank=True, choices=[(None, 'None (keep all readings)'), (168, 'Discard most readings after one week'), (672, 'Discard most readings after one month'), (4032, 'Discard most readings after six months'), (8064, 'Discard most readings after one year')], default=None, help_text='The lifetime of readings, before discarding them. Please note that retention is applied during night time currently, between midnight and six in the morning.', null=True, verbose_name='Data retention')),
            ],
            options={
                'verbose_name': 'Retention configuration',
                'default_permissions': (),
            },
        ),
    ]
