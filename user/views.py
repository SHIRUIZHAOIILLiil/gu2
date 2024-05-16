from django.shortcuts import render, HttpResponse, redirect
from django.db.models import Q
from django.db.models import Count

from supervise.utils.pagination import Pagination
from supervise.utils.code import check_code
from io import BytesIO
from user import models
from django import forms
from django.core.validators import RegexValidator
from django.core.exceptions import ValidationError
from user.models import User, Admin, Site_Ad, Site
import hashlib

"""This is a password encryption function 
that uses MD5 encryption to encrypt the user's password."""


# Create your views here.
def pwd_encrypt(pwd):
    md5 = hashlib.md5()
    md5.update(pwd.encode())
    result = md5.hexdigest()
    return result


"""This is a login class that inherits from ModelForm.
 It can display information boxes on front-end pages,
  as well as functions that validate data input types."""


class Login_Form(forms.ModelForm):
    code = forms.CharField(
        label="Verification code",
        widget=forms.PasswordInput(render_value=True),
        required=True
    )

    class Meta:
        model = User

        fields = ["phone", "password", "code"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.p = None
        for name, field in self.fields.items():
            if name == "password":
                field.widget.input_type = 'password'
            field.widget.attrs = {"placeholder": "Enter your " + field.label + " for login..."}

    def clean_phone(self):
        txt_phone = self.cleaned_data["phone"]
        if self.data.get("role") == "user":
            query = User.objects.filter(phone=txt_phone)
            if not bool(query):
                # print(self.cleaned_data)
                raise ValidationError("Wrong phone number!")
            self.p = txt_phone
            return self.p
        else:
            query = Admin.objects.filter(admin_no=txt_phone)
            if not bool(query):
                raise ValidationError("Login without permission!")
            self.p = txt_phone
            return self.p

    def clean_password(self):
        if self.p is not None:
            if self.data.get("role") == "user":
                txt_password = pwd_encrypt(self.cleaned_data["password"])
                query = User.objects.filter(phone=self.p, password=txt_password)
                if not bool(query):
                    raise ValidationError("Please enter the correct password!")
                return txt_password
            txt_password = self.cleaned_data["password"]
            query = Admin.objects.filter(admin_no=self.p, password=txt_password)
            if not bool(query):
                raise ValidationError("Please enter the correct password!")
            return txt_password
        raise ValidationError("Please enter the correct user name first")


"""This is a register class that inherits from ModelForm.
 It can display information boxes on front-end pages,
  as well as functions that validate data input types."""


class MyForm(forms.ModelForm):
    password = forms.CharField(label="Password", validators=[RegexValidator(r'^[0-9a-zA-Z]{6,18}$')])
    phone = forms.CharField(label="Phone", validators=[RegexValidator(r'^[0-9]{7,12}$')])

    class Meta:
        model = User
        fields = ["phone", "name", "password"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():
            if name == "password":
                field.widget.input_type = 'password'

            field.widget.attrs = {"placeholder": "please input your " + field.label + "..."}

    def clean_phone(self):
        txt_phone = self.cleaned_data["phone"]
        query = User.objects.filter(phone=txt_phone)
        if bool(query):
            raise ValidationError("This account has already been registered.")
        return txt_phone

"""This is a place code registration class 
that inherits from ModelForm and 
can display an information box on the front-end page."""


class Site_A(forms.ModelForm):
    class Meta:
        model = Site_Ad
        fields = ["address", "street"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():
            field.widget.attrs = {"placeholder": "Please input your " + name + "..."}


"""This is a login view function that 
guides the user to the login interface. 
After entering the correct user name and password, 
users can log in to the home page and use other functions."""


def user_login(req):
    if req.method == "GET":
        frm = Login_Form()
        return render(req, "user_login.html", {"frm": frm}, )
    frm = Login_Form(data=req.POST)
    if frm.is_valid():
        username = req.POST.get("phone")
        role = req.POST.get("role")
        code = req.session.get('image_code', "")
        user_code = req.POST.get("code")
        if user_code.upper() != code:
            frm.add_error("code", "Verification code error")
            return render(req, "user_login.html", {"frm": frm})
        if role == "user":
            password = pwd_encrypt(req.POST.get("password"))
            value = models.User.objects.filter(phone=username, password=password)
            if value:
                userInfo = models.User.objects.filter(phone=username).values('iduser', 'name', 'status')
                req.session["Info"] = {'id': userInfo[0]['iduser'], 'phone': username,
                                       'name': userInfo[0]['name'], 'status': userInfo[0]['status'],
                                       'role': role}
                return redirect("/index")
            else:
                return render(req, "user_login.html", {"frm": frm})
        else:
            password = req.POST.get("password")
            value = models.Admin.objects.filter(admin_no=username, password=password)
            if value:
                userInfo = models.Admin.objects.filter(admin_no=username).values('idadmin', 'admin_no')
                req.session["Info"] = {'id': userInfo[0]['idadmin'], 'phone': userInfo[0]['admin_no'], 'role': role}
                return redirect("/index2")
            else:
                return render(req, "user_login.html", {"frm": frm})

    else:
        return render(req, "user_login.html", {"frm": frm})


"""This is a registration view function that guides the user to the registration interface.
 After entering reasonable information, the user can register an account,
  and the entered information is entered into the database."""


def user_register(req):
    if req.method == "GET":
        form = MyForm()
        return render(req, "user_register.html", {"form": form})
    form = MyForm(data=req.POST)
    if form.is_valid():
        phone = req.POST.get("phone")
        name = req.POST.get("name")
        password = pwd_encrypt(req.POST.get("password"))
        User.objects.create(phone=phone, name=name, password=password, status="health")
        return redirect("/user/login")
    else:
        return render(req, "user_register.html", {"form": form})


"""This is the application site code view function,
 which guides the user to the application site code interface.
  After entering reasonable information, users can apply for registration site code."""


def user_site(req):
    if req.method == "GET":
        form = Site_A()
        return render(req, "user_site_register.html", {"form": form})
    form = Site_A(data=req.POST)
    if form.is_valid():
        address = req.POST.get("address")
        street = req.POST.get("street")
        iduser = User.objects.filter(iduser=req.session.get("Info")["id"]).first()
        Site_Ad.objects.create(iduser=iduser, address=address, street=street)
        return redirect("/index")
    else:
        return render(req, "user_site_register.html", {"form": form})


"""This is a user's personal information view function 
that guides the user to the personal information display interface, 
where you can view personal information and status."""


def user_info(req):
    if req.method == "GET":
        return render(req, "Info.html")


"""This is an account logout view function 
that allows users to log out of their accounts and switch to other accounts."""


def logout(req):
    req.session.clear()
    return redirect('/index')


"""This is a view function of the places where users view personal applications. 
This function allows users to view approved places."""


def user_mysite(req):
    iduser = req.session.get("Info")['id']
    search = Site.objects.filter(iduser=iduser).all()
    count = Site.objects.filter(iduser=iduser).aggregate(Count("iduser"))
    content = {'search': search,"count":count}
    return render(req, 'mysite.html', content)


"""This is a user view function for viewing personal code scanning records.
 This function allows users to view their own code scanning records,
  and users can search for corresponding data by searching criteria."""


def usersite(req):
    if req.method == "GET":
        userInfo = req.session.get("Info")["id"]
        value = req.GET.get("search")
        search_time = req.GET.get("s_time")
        page = int(req.GET.get('page', 1))
        items_per_page = 10
        page_start_index = (page - 1) * items_per_page
        if value:
            queryset = models.Us.objects.filter(Q(idsite__idsite=value) |
                                                Q(iduser__iduser=value),
                                                iduser__iduser=userInfo
                                                )
            count = models.Us.objects.filter(Q(idsite__idsite=value) |
                                                Q(iduser__iduser=value),
                                                iduser__iduser=userInfo).aggregate(Count('iduser'))
        elif search_time:
            queryset = models.Us.objects.filter(Q(e_time__year=search_time) |
                                                Q(e_time__day=search_time) |
                                                Q(e_time__month=search_time) |
                                                Q(e_time__hour=search_time) |
                                                Q(e_time__minute=search_time),
                                                iduser__iduser=userInfo
                                                )
            count = models.Us.objects.filter(Q(e_time__year=search_time) |
                                                Q(e_time__day=search_time) |
                                                Q(e_time__month=search_time) |
                                                Q(e_time__hour=search_time) |
                                                Q(e_time__minute=search_time),
                                                iduser__iduser=userInfo).aggregate(Count('iduser'))
        else:
            queryset = models.Us.objects.filter(iduser__iduser=userInfo)
            count = models.Us.objects.filter(iduser__iduser=userInfo).aggregate(Count('iduser'))
        page_object = Pagination(req, queryset)
        page_queryset = page_object.page_queryset
        page_str = page_object.pages()
        content = {"queryset": page_queryset, "page_str": page_str,"count": count,"page_start_index":page_start_index}
    return render(req, 'usersite.html', content)


def ut(req):
    sta = "health"
    s = User.objects.filter(Q(name=sta) | Q(status=sta)).all()
    return render(req, 'wsnd.html', {"s": s})


"""This is the verification code generation function, 
which obtains a verification code through the verification code tool, 
and then displays the verification code to the front-end interface."""


def image(req):
    img, code_str = check_code()

    req.session['image_code'] = code_str
    stream = BytesIO()
    img.save(stream, 'png')
    return HttpResponse(stream.getvalue())
