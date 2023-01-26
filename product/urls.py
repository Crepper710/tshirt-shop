from django.urls import path

from . import views

urlpatterns = [
    path('list/', views.list_, name='list'),
    path('info/', views.info, name='info'),
    path('shopping_card/', views.shopping_card, name='shopping_card')
]
