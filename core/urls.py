from django.urls import  path

from myresume.urls import urlpatterns
from .views import index

urlpatterns = [
    path('', index, name='index'),
    path('<slug>/', redirect_urls, name='redirect_urls'),
]