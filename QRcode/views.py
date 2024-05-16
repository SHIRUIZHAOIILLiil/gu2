from django.shortcuts import render, HttpResponse
from django.db.models import Count
from django.db.models import Q

from supervise.utils.pagination import Pagination
import qrcode
import ast
import datetime
from QRcode.models import Site
from QRcode.models import Us
from QRcode.models import User
from django.forms.models import model_to_dict
from pyzbar.pyzbar import decode
from PIL import Image


path = "static/qrcode/"


"""This is a two-dimensional code generation function
 that contains the generation rules for two-dimensional codes."""


def qr_generate(dictionary):
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4
    )
    qr.add_data(dictionary)
    qr.make(fit=True)
    return qr


"""This is a two-dimensional code generation view function
 that allows you to generate a two-dimensional code for 
 the address of the site that has been applied for and store it in the system."""


def generate(req):
    if req.method == "GET":
        sql = Site.objects.filter(path=None).first()

    if sql is not None:
        sql = model_to_dict(sql)
        qr = qr_generate(sql)
        img = qr.make_image(fill_color=(70, 228, 115), back_color="white")
        img.save(path + str(sql['idsite']) + ".png")
        Site.objects.filter(idsite=str(sql['idsite'])).update(path=path + str(sql['idsite']) + ".png")
        return render(req, "gqr.html")
    else:
        return HttpResponse("The instance was not found")
    return render(req, "gqr.html")


"""This is a 2D code decoding view function that allows 
the user to simulate the scanning of 2D codes in actual scenes, 
decode the information needed, and then enter the scanning information into the database."""


def decodeqr(req, sid):
    if req.method == "GET":
        site = Site.objects.filter(idsite=sid).first()
        Info = str(decode(Image.open(site.path))[0][0])
        Info = ast.literal_eval(Info.split('\"')[1])
        now_time = datetime.datetime.now()
        idsite = Site.objects.filter(idsite=Info["idsite"]).first()
        iduser = User.objects.filter(iduser=req.session.get("Info")["id"]).first()
        Us.objects.create(idsite=idsite, iduser=iduser, e_time=now_time)
        return render(req, "decode.html")


"""This is a function for displaying all QR codes in the database. 
This function allows the user to display all healthy QR codes in the database, 
and then scan a single QR code."""


def qrscan(req):
    if req.method == "GET":
        value = req.GET.get("search")
        if value:
            queryset = Site.objects.filter(Q(idsite__contains=value) | Q(address__contains=value)
                                            | Q(street__contains=value), status="health")
            count = Site.objects.filter(Q(idsite__contains=value) | Q(address__contains=value)
                                            | Q(street__contains=value), status="health").aggregate(Count("idsite"))
        else:
            queryset = Site.objects.filter(status="health")
            count = Site.objects.all().aggregate(Count("idsite"))
        page_object = Pagination(req, queryset)
        page_queryset = page_object.page_queryset
        page_str = page_object.pages()
        content = {'queryset': page_queryset, "page_str": page_str,"count":count}
        return render(req, "scan.html", content)


"""This is a single QR code display view function
that allows you to display all information
about a specific location, and then scan it."""


def scansingle(req, sid):
    if req.method == "GET":
        site = Site.objects.filter(idsite=sid).first()
        return render(req, "scan_single.html", {"site": site})
