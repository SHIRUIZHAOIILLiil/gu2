from django.shortcuts import render, HttpResponse


# Create your views here.
"""This is the main page view function, 
accessed through the URL path,
and then returned to the user index interface."""


def index(req):
    return render(req, "index.html")


"""This is the admin main page view function, 
accessed through the URL path,
and then returned to the admin index interface."""


def index2(req):
    return render(req, "index2.html")


def test(req):
    print(req.session.get("Info")["phone"])
    return render(req, "test.html")
