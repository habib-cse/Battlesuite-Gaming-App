# Generated by Django 3.1.5 on 2021-02-19 00:43

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('core', '0014_subscription'),
    ]

    operations = [
        migrations.AddField(
            model_name='tournamentwin',
            name='players',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL),
        ),
    ]
