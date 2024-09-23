from django.urls import  path

from MyResume.urls import urlpatterns
from .views import index

urlpatterns=[
    path('', index, name='index'),
]