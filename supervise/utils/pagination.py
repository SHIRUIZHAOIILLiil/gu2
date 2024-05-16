from django.utils.safestring import mark_safe
import copy


"""This is the page pagination tool class.
When there is too much data displayed on the page,
this function will be used to paginate some data."""


class Pagination(object):

    def __init__(self, request, queryset, page_size=10, page_param="page", plus=5):

        query_dict = copy.deepcopy(request.GET)
        query_dict.mutable = True
        self.query_dict = query_dict
        self.page_param = page_param
        page = request.GET.get(page_param, "1")
        if page.isdecimal():
            page = int(page)
        else:
            page = 1
        self.page = page
        self.page_size = page_size
        self.start = (page - 1) * 10
        self.end = page * 10

        self.page_queryset = queryset[self.start:self.end]

        #总条数
        total = queryset.count()

        page_count, div = divmod(total, page_size)
        plus = 5
        if div:
            page_count += 1
        self.page_count = page_count
        self.plus = plus

    def pages(self):
        #总页数小于页数两倍的plus
        if self.page_count <= 2 * self.plus + 1:
            start_page = 1
            end_page = self.page_count
        else:
            #当前页数小于5，起始页设置为1
            if self.page <= self.plus:
                start_page = 1
                end_page = 2 * self.plus
            else:
                #页数大于数据总数
                if (self.page + self.plus) > self.page_count:
                    start_page = self.page - 5
                    end_page = self.page_count
            start_page = self.page - self.plus
            end_page = self.page + self.plus

        page_list = []

        if self.page > 1:
            self.query_dict.setlist(self.page_param, [self.page - 1])
            prev = '<li class=""><a href="?{}">Prev</a></li>'.format(self.query_dict.urlencode())
        else:
            self.query_dict.setlist(self.page_param, [1])
            prev = '<li class=""><a href="?{}">Prev</a></li>'.format(self.query_dict.urlencode())
        page_list.append(prev)

        for i in range(start_page, end_page + 1):
            self.query_dict.setlist(self.page_param, [i])
            if i is self.page:
                ele = '<li class="active"><a href="?{}">{}</a></li>'.format(self.query_dict.urlencode(), i)
            else:
                ele = '<li ><a href="?{}">{}</a></li>'.format(self.query_dict.urlencode(), i)
            page_list.append(ele)

        if self.page < self.page_count:
            self.query_dict.setlist(self.page_param, [self.page + 1])
            Next = '<li class=""><a href="?{}">Next</a></li>'.format(self.query_dict.urlencode())
        else:
            self.query_dict.setlist(self.page_param, [self.page_count])
            Next = '<li class=""><a href="?{}">Next</a></li>'.format(self.query_dict.urlencode())
        page_list.append(Next)

        search_string = """
                <li>
                                <form method="get" style="float: left;margin-left: -1px">
                                    <div class="input-group" style="width: 200px"></div>
                                    <input type="text"
                                           style="position:relative;float:left;display: inline-block;width: 80px;border-radius: 0"
                                           name="page" class="form-control" placeholder="page...">
                                    <button class="btn btn-default" style="border-radius: 0" type="submit">Skip</button>
                                </form>
                            </li>
                """
        page_list.append(search_string)
        page_str = mark_safe("".join(page_list))
        return page_str
