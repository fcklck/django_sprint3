from django.contrib import admin
from .models import Post, Category, Location
from django.utils.translation import gettext_lazy as _

# Регистрация модели Post в админ-панели
@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ['title', 'author', 'pub_date', 'category', 'location', 'is_published']
    search_fields = ['title', 'text']
    list_filter = ['category', 'author', 'is_published']
    fieldsets = (
        (None, {
            'fields': ('title', 'text', 'author', 'category', 'location', 'pub_date', 'is_published')
        }),
        (_('Advanced options'), {
            'classes': ('collapse',),
            'fields': ('created_at',)
        }),
    )

# Регистрация модели Category в админ-панели
@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['title', 'is_published', 'created_at']
    search_fields = ['title']
    fieldsets = (
        (None, {
            'fields': ('title', 'description', 'slug', 'is_published')
        }),
        (_('Advanced options'), {
            'classes': ('collapse',),
            'fields': ('created_at',)
        }),
    )

# Регистрация модели Location в админ-панели
@admin.register(Location)
class LocationAdmin(admin.ModelAdmin):
    list_display = ['name', 'is_published', 'created_at']
    search_fields = ['name']
    fieldsets = (
        (None, {
            'fields': ('name', 'is_published')
        }),
        (_('Advanced options'), {
            'classes': ('collapse',),
            'fields': ('created_at',)
        }),
    )
