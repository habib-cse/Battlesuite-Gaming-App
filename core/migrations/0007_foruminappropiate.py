# Generated by Django 3.1.2 on 2020-10-24 10:08

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('core', '0006_friendrequest'),
    ]

    operations = [
        migrations.CreateModel(
            name='Foruminappropiate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('datetime', models.DateTimeField(auto_now_add=True)),
                ('status', models.BooleanField(default=True)),
                ('forum', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.communityforum')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Inappropriate Forum',
                'verbose_name_plural': 'Inappropriate Forums',
            },
        ),
    ]
