# -*- coding: utf-8 *-*
"""
WSGI config for Mima project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.9/howto/deployment/wsgi/
"""
import os , sys
from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Mima.settings")
#os.environ['LC_ALL']="it_IT.UTF-8"
#locale.setlocale(locale.LC_ALL, 'en_US.UTF-8')
#sys.setdefaultencoding('utf-8')
#import sys
reload(sys)  # Reload does the trick!
sys.setdefaultencoding('UTF8')


application = get_wsgi_application()

