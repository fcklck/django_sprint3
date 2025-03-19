# blog/urls.py

from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),  # Главная страница
    path('category/<slug:category_slug>/', views.category, name='category'),  # Страница категории
    path('post/<int:post_id>/', views.post_detail, name='post_detail'),  # Страница публикации
]
