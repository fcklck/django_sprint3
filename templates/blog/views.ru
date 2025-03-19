# blog/views.py

from django.shortcuts import get_object_or_404
from .models import Post
from django.http import Http404
from django.utils import timezone

def post_detail(request, post_id):
    # Получаем публикацию по первичному ключу
    post = get_object_or_404(Post, pk=post_id)
    
    # Проверяем, опубликована ли публикация, не превышена ли дата публикации
    if post.pub_date > timezone.now() or not post.is_published or not post.category.is_published:
        raise Http404  # Если публикация или категория не опубликованы или дата еще не наступила — ошибка 404
    
    return render(request, 'blog/post_detail.html', {'post': post})
