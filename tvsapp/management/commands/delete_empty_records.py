#!/usr/bin/python
from django.core.management.base import BaseCommand, CommandError
from django.core.mail import send_mail, EmailMessage, BadHeaderError
from django.contrib.auth.models import User
from tvsapp.models import *
from django.contrib.contenttypes.models import ContentType
from datetime import datetime
from django.db.models import Q

class Command(BaseCommand):

    def handle(self, *args, **options):
        empty_list = Tvs_Truck_Data.objects.filter(info2=None,info3=None,\
                    info4=None,info5=None)
        print empty_list.count()
        empty_list.delete()
        pass
