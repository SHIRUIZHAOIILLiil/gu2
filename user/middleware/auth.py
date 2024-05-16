from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import redirect


class Author(MiddlewareMixin):

    def process_request(self, request):

        if request.path_info in ["/index/", "/user/register", "/user/login",
                                "/image/code"]:
            return

        info_dict = request.session.get("Info")
        if info_dict:
            return
        return redirect("/user/login")


class Role(MiddlewareMixin):

    def process_request(self, request):
        Info = request.session.get("Info")
        if Info is not None:
            role = Info["role"]
            if (request.path.startswith('/SP/') or  request.path.startswith(
                    '/index2')) \
                    and not role == "admin":
                print(role)
                return redirect('/index')
            response = self.get_response(request)
            return response
        else:
            return
