# Generated by Django 4.2.7 on 2023-11-07 15:45

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('projectapp', '0002_alter_project_title'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('subscribeapp', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='subscription',
            old_name='user',
            new_name='users',
        ),
        migrations.AlterUniqueTogether(
            name='subscription',
            unique_together={('users', 'project')},
        ),
    ]