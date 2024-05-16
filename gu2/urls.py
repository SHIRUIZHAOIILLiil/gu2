"""gu2 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
import index
import supervise
import user
import QRcode
from django.urls import path
from index import views
from user import views
from QRcode import views
from supervise import views


urlpatterns = [
    # path('admin/', admin.site.urls),
    path('index/', index.views.index, name='index'),
    path('index2/', index.views.index2, name='index2'),

    path('user/login', user.views.user_login, name='login'),
    path('user/register', user.views.user_register, name='register'),
    path('user/site', user.views.user_site, name='site_register'),
    path('user/info', user.views.user_info, name='user_info'),
    path('logout', user.views.logout, name='logout'),
    path('user/mysite', user.views.user_mysite, name='mysite'),
    path('user/usersite', user.views.usersite),
    path('image/code', user.views.image),

    path('QR/generate', QRcode.views.generate),
    path('QR/<int:sid>/decode', QRcode.views.decodeqr),
    path('QR/scan', QRcode.views.qrscan),
    path('QR/<int:sid>/scansingle', QRcode.views.scansingle),

    path('SP/verify', supervise.views.verify),
    path('SP/<int:said>/vfcomplete', supervise.views.complete),
    path('SP/<int:said>/vffail', supervise.views.fail),
    path('SP/user_status', supervise.views.user_status),
    path('SP/<int:iduser>/user_modify', supervise.views.user_modify),
    path('SP/site_status', supervise.views.site_status),
    path('SP/<int:idsite>/site_modify', supervise.views.site_modify),
    path('SP/us_status', supervise.views.us_status),

    path('test', index.views.test),
    path('ut', user.views.ut)

]
