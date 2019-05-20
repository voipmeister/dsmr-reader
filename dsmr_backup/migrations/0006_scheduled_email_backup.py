# Generated by Django 2.0.9 on 2018-12-25 21:54

from django.db import migrations
from django.conf import settings


def migrate_forward(apps, schema_editor):
    ScheduledProcess = apps.get_model('dsmr_backend', 'ScheduledProcess')
    ScheduledProcess.objects.create(
        name='Backup per email',
        module=settings.DSMRREADER_MODULE_EMAIL_BACKUP
    )


def migrate_backward(apps, schema_editor):
    ScheduledProcess = apps.get_model('dsmr_backend', 'ScheduledProcess')
    ScheduledProcess.objects.filter(module=settings.DSMRREADER_MODULE_EMAIL_BACKUP).delete()


class Migration(migrations.Migration):

    dependencies = [
        ('dsmr_backup', '0005_email_backup_settings'),
    ]

    operations = [
        migrations.RunPython(migrate_forward, migrate_backward),
    ]
