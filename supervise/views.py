from django.shortcuts import render, redirect
from supervise import models
from supervise.utils.pagination import Pagination
from django.db.models import Q
from django.db.models import Count
import time, datetime
# Create your views here.


"""This is the administrator's review site code view function. 
This function allows you to display the site code information submitted by users. 
After approval, you can create a QR code."""


def verify(req):
    if req.method == "GET":
        value = req.GET.get("search")
        if value:
            query = models.SiteAd.objects.filter(Q(idsa__contains=value) |
                                              Q(iduser__iduser__contains=value) |
                                              Q(address__contains=value) |
                                              Q(street__contains=value))
            count = models.SiteAd.objects.filter(Q(idsa__contains=value) |
                                              Q(iduser__iduser__contains=value) |
                                              Q(address__contains=value) |
                                              Q(street__contains=value)).aggregate(Count('idsa'))
        else:
            query = models.SiteAd.objects.filter()
            count = models.SiteAd.objects.all().aggregate(Count('idsa'))
    content = {"query": query, 'count': count}
    return render(req, 'siteverify.html', content)


def fail(req, said):
    site_release = models.SiteAd.objects.filter(idsa=said).delete()
    return render(req, 'vffail.html')


"""This is the administrator's review site code confirmation view function. 
Through this function, the site code information submitted 
by the user can be submitted to the system database, 
and a QR code will be generated."""


def complete(req, said):
    vsite = models.SiteAd.objects.filter(idsa=said).first()
    admin = models.Admin.objects.filter(idadmin=req.session.get("Info")["id"]).first()
    iduser = vsite.iduser
    address = vsite.address
    street = vsite.street
    input_site = models.Site.objects.create(iduser=iduser, address=address, street=street, idadmin=admin,
                                            status="health")
    site_release = models.SiteAd.objects.filter(idsa=said).delete()
    return redirect('/QR/generate')


"""This is a function for administrators to view user information. 
This function allows you to list the information of all users and search 
for users based on specific criteria."""


def user_status(req):
    if req.method == "GET":
        value = req.GET.get("search")
        if value:
            """Q(iduser=value) | Q(phone=value) | Q(name=value) | Q(status=value)"""
            queryset = models.User.objects.filter(Q(iduser__contains=value) |
                                                  Q(phone__contains=value) |
                                                  Q(name__contains=value) |
                                                  Q(status__contains=value))
            count = models.User.objects.filter(Q(iduser__contains=value) |
                                                  Q(phone__contains=value) |
                                                  Q(name__contains=value) |
                                                  Q(status__contains=value)).aggregate(Count('iduser'))
        else:
            queryset = models.User.objects.filter()
            count = models.User.objects.all().aggregate(Count('iduser'))
        page_object = Pagination(req, queryset)
        page_queryset = page_object.page_queryset

        page_str = page_object.pages()
        content = {"user": page_queryset, "page_str": page_str,"count":count}
    return render(req, "user_status.html", content)


"""This is a function for the administrator to modify the user information view. 
This function allows the user to receive modifications to 
the user status information on the front-end page, 
and save the modified data to the database."""


def user_modify(req, iduser):
    userInfo = models.User.objects.filter(iduser=iduser).first()
    if req.method == "GET":
        return render(req, "user_modify.html", {"userInfo": userInfo})
    status = req.POST.get("status")
    user = models.User.objects.filter(iduser=iduser).update(status=status)
    return redirect("/SP/user_status")


"""This is a function for administrators to view user's sites information. 
This function allows you to list the information of all sites and search 
for sites based on specific criteria."""


def site_status(req):
    if req.method == "GET":
        value = req.GET.get("search")
        if value:
            queryset = models.Site.objects.filter(Q(iduser__iduser__contains=value) |
                                                  Q(idsite__contains=value) |
                                                  Q(idadmin__idadmin__contains=value) |
                                                  Q(address__contains=value) |
                                                  Q(street__contains=value) |
                                                  Q(status__contains=value))
            count = models.Site.objects.filter(Q(iduser__iduser__contains=value) |
                                                  Q(idsite__contains=value) |
                                                  Q(idadmin__idadmin__contains=value) |
                                                  Q(address__contains=value) |
                                                  Q(street__contains=value) |
                                                  Q(status__contains=value)).aggregate(Count('idsite'))
        else:
             queryset = models.Site.objects.filter()
             count = models.Site.objects.all().aggregate(Count('idsite'))
        page_object = Pagination(req, queryset)
        page_queryset = page_object.page_queryset
        page_str = page_object.pages()
        content = {"site": page_queryset, "page_str": page_str,"count":count}
    return render(req, "site_status.html", content)


"""This is a function for the administrator to modify the site information view. 
This function allows the user to receive modifications to 
the site status information on the front-end page, 
and save the modified data to the database."""


def site_modify(req, idsite):
    siteInfo = models.Site.objects.filter(idsite=idsite).first()
    if req.method == "GET":
        return render(req, "site_modify.html", {"siteInfo": siteInfo})
    status = req.POST.get("status")
    site = models.Site.objects.filter(idsite=idsite).update(status=status)
    return redirect("/SP/site_status")


"""This is a view function for administrators to view all user scanning records. 
Administrators can also search based on specific criteria, 
and the searched content will be returned to this page."""


def us_status(req):
    if req.method == "GET":
        value = req.GET.get("search")
        search_time = req.GET.get("s_time")
        if value:
            queryset = models.Us.objects.filter(Q(idus=value) |
                                                Q(idsite__idsite=value) |
                                                Q(iduser__iduser=value)
                                                )
            count = models.Us.objects.filter(Q(idus=value) |
                                                Q(idsite__idsite=value) |
                                                Q(iduser__iduser=value)).aggregate(Count('idus'))
        elif search_time:
            queryset = models.Us.objects.filter(Q(e_time__year=search_time) |
                                                Q(e_time__day=search_time) |
                                                Q(e_time__month=search_time) |
                                                Q(e_time__hour=search_time) |
                                                Q(e_time__minute=search_time) 
                                                )
            count = models.Us.objects.filter(Q(e_time__year=search_time) |
                                                Q(e_time__day=search_time) |
                                                Q(e_time__month=search_time) |
                                                Q(e_time__hour=search_time) |
                                                Q(e_time__minute=search_time)).aggregate(Count('idus'))
        else:
            queryset = models.Us.objects.filter()
            count = models.Us.objects.all().aggregate(Count('idus'))
        page_object = Pagination(req, queryset)
        page_queryset = page_object.page_queryset
        page_str = page_object.pages()
        content = {"queryset": page_queryset, "page_str": page_str,"count":count}
    return render(req, "us_status.html", content)
