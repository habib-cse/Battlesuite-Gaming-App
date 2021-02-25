
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings
from core import  views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('allauth.urls')),
    path('', include('core.urls', namespace='core')),
    path('.well-known/pki-validation/37E000EFB71CA98D33942FBFC59AE7F0.txt', views.read_file),
    path('accounts/', include('accounts.urls', namespace='account')),
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT) 