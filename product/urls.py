from django.urls import path

from . import views

urlpatterns = [
    path('list/', views.list_, name='list'),
    path('info/', views.info, name='info'),
    path('shopping_cart/', views.shopping_cart, name='shopping_cart'),
    path('check_out/', views.check_out, name='check_out')
]
