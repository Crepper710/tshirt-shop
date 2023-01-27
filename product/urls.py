from django.urls import path

from . import views

urlpatterns = [
    path('list/', views.list_, name='list'),
    path('info/', views.info, name='info'),
    path('shopping_cart/', views.shopping_cart, name='shopping_cart')
]
