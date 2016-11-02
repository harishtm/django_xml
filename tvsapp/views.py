from django.shortcuts import render, HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User
from tvsapp.models import *
from django.core import serializers
from django.views.decorators.csrf import csrf_exempt
from django.db.models import Q, Count
import datetime
import csv


"""
def tvs_xml_data(request):
    ship_list = Shipment.objects.all()
    XMLSerializer = serializers.get_serializer("xml")
    xml_serializer = XMLSerializer()
    xml_serializer.serialize(ship_list, fields=('origin_address','destination_address'))
    data = xml_serializer.getvalue()
    return HttpResponse(data,content_type='text/xml')
"""

from django.template.loader import render_to_string

"""
def tvs_xml_data(request):
    ship_list = Tvs_Truck_Data.objects.all()
    xml = render_to_string('xml_template.xml', {'query_set': ship_list})
    return HttpResponse(xml,content_type="application/xml")
"""

@csrf_exempt
def tvs_xml_post_data(request):
    """
        GET parameter Code but named to POST(tvs_xml_post_data)
        code works for GET
    """
    if request.method == 'GET':
        count = 0
        cid = request.GET.get('cid')
        ckey = request.GET.get('ckey')
        if cid == 'TVS-01-MAA' and ckey == 'QvsX2@er':
            txd = Tvs_Xml_Data.objects.filter(customer_id= cid, customer_key = ckey)
            if txd:
                txd = txd.order_by('-id')[0]
                ship_list = Tvs_Truck_Data.objects.filter(id__gt = \
                                    int(txd.last_id)).exclude(info2=None,info3=None,info4=None).order_by('id')
                count = ship_list.count()
                if ship_list:
                    lid = ship_list.latest('id').id
                else:
                    lid = txd.last_id
            else:
                ship_list = Tvs_Truck_Data.objects.exclude(info2=None,info3=None,info4=None).order_by('id')
                count = ship_list.count()
                lid = ship_list.latest('id').id
            txd_obj = Tvs_Xml_Data.objects.create(customer_id = cid , \
                                                customer_key = ckey,\
                                                created_on = datetime.datetime.now(),
                                                last_id = int(lid),
                                                no_of_records = int(count))
            xml = render_to_string('xml_template.xml', {'query_set': ship_list})
            return HttpResponse(xml,content_type="application/xml")
        else:
            return HttpResponse("Invalid Credentials")
    else:
        return HttpResponse("Invalid Request through POST")


@csrf_exempt
def tvs_xml_data(request):
    if request.method == 'POST':
        count = 0
        cid = request.POST.get('cid')
        ckey = request.POST.get('ckey')
        if cid == 'TVS-01-MAA' and ckey == 'QvsX2@er':
            txd = Tvs_Xml_Data.objects.filter(customer_id= cid, customer_key = ckey)
            if txd:
                txd = txd.order_by('-id')[0]
                ship_list = Tvs_Truck_Data.objects.filter(id__gt = \
                                    int(txd.last_id)).exclude(info2=None,info3=None,info4=None).order_by('id')
                count = ship_list.count()
                if ship_list:
                    lid = ship_list.latest('id').id
                else:
                    lid = txd.last_id
            else:
                ship_list = Tvs_Truck_Data.objects.exclude(info2=None,info3=None,info4=None).order_by('id')
                count = ship_list.count()
                lid = ship_list.latest('id').id
            txd_obj = Tvs_Xml_Data.objects.create(customer_id = cid , \
                                                customer_key = ckey,\
                                                created_on = datetime.datetime.now(),
                                                last_id = int(lid),
                                                no_of_records = int(count))
            xml = render_to_string('xml_template.xml', {'query_set': ship_list})
            return HttpResponse(xml,content_type="application/xml")
        else:
            return HttpResponse("Invalid Credentials")
    else:
        return HttpResponse("Invalid Request through GET")



@csrf_exempt
def tvs_xml_post_data_check(request):
    if request.method == 'POST':
        count = 0
        cid = request.POST.get('cid')
        ckey = request.POST.get('ckey')
        if cid == 'TVS-01-MAA' and ckey == 'QvsX2@er':
            txd = Tvs_Xml_Data.objects.filter(customer_id= cid, customer_key = ckey)
            if txd:
                txd = txd.order_by('-id')[0]
                ship_list = Tvs_Truck_Data.objects.filter(id__gt = \
                                    int(txd.last_id)).exclude(info2=None,info3=None,info4=None).order_by('id')
                count = ship_list.count()
                if ship_list:
                    lid = ship_list.latest('id').id
                else:
                    lid = txd.last_id
            else:
                ship_list = Tvs_Truck_Data.objects.exclude(info2=None,info3=None,info4=None).order_by('id')
                count = ship_list.count()
                lid = ship_list.latest('id').id
            txd_obj = Tvs_Xml_Data.objects.create(customer_id = cid , \
                                                customer_key = ckey,\
                                                created_on = datetime.datetime.now(),
                                                last_id = int(lid),
                                                no_of_records = int(count))
            xml = render_to_string('xml_template.xml', {'query_set': ship_list})
            return HttpResponse(xml,content_type="application/xml")
        else:
            return HttpResponse("Invalid Credentials")
    else:
        return HttpResponse("Invalid Request through GET")


@csrf_exempt
def tvs_xml_get_data(request):
    ship_list = []
    if request.method == 'GET':
        count = 0
        cid = request.GET.get('cid')
        ckey = request.GET.get('ckey')
        if cid.lower() == 'TVS-01-MAA'.lower() and ckey == 'QvsX2@er':
            txd = Tvs_Xml_Data.objects.filter(customer_id= cid, customer_key = ckey)
            if txd:
                ship_list = Tvs_Truck_Data.objects.exclude(info2=None,info3=None,info4=None).order_by('-id')
                ship_list = ship_list.exclude(info4 = '')[:100]
            xml = render_to_string('xml_template.xml', {'query_set': ship_list})
            return HttpResponse(xml,content_type="application/xml")
        else:
            return HttpResponse("Invalid Credentials")
    else:
        return HttpResponse("Invalid Request through POST")


@csrf_exempt
def tvs_xml_structure(request):
    ship_list = []
    if request.method == 'GET':
        ship_list = Tvs_Truck_Data_As_Raw.objects.all().order_by('-id')[:100]
        xml = render_to_string('structure_xml_template.xml', {'query_set': ship_list})
        return HttpResponse(xml,content_type="application/xml")
    else:
        return HttpResponse("Invalid Request through POST")


def check_customer_order_count(view):

    def wrap_order_count(request, *args, **kwargs):
        try:
            records = int(request.GET.get('records')) if request.GET.get('records') else -1
        except:
            return HttpResponse("Records can conatin only number")
        order = request.GET.get('order','')
        cid = request.GET.get('cid','')
        if request.method == 'GET':
            if order and records and cid:
                if records > 1000 or records < 0:
                    return HttpResponse("Please enter records less than 1000 and greater than 0")
                elif order not in ['asc','desc']:
                    return HttpResponse("Order should be: asc or desc only")
                elif cid in ['', u'']:
                    return HttpResponse("Please enter customer Id")
            else:
                return HttpResponse('Please provide order, records and customer Id(cid)!!!!')
        else:
            return HttpResponse("Invalid Request through POST")
        return view(request, *args, **kwargs)

    return wrap_order_count


@csrf_exempt
@check_customer_order_count
def tvs_zone_data(request):
    ship_list = []
    cid = request.GET.get('cid')
    order = request.GET.get('order')
    records = request.GET.get('records')
    ship_list = Tvs_Truck_Data.objects.filter(info4=cid)
    if ship_list:
        if order == 'asc':
            ship_list = ship_list.order_by('id')[:records]
        elif order == 'desc':
            ship_list = ship_list.order_by('-id')[:records]
        xml = render_to_string('zone_xml_template.xml', {'query_set': ship_list})
        return HttpResponse(xml,content_type="application/xml")
    else:
        return HttpResponse("No data for given customer!!!")



def get_csv_data(request):
    if request.method == 'GET' and request.GET.get('count'):
        records = request.GET.get('count')
        if int(records) <= 500:
            dt = str(datetime.datetime.now().date())
            response = HttpResponse(content_type='text/csv')
            response['Content-Disposition'] = 'attachment; filename="LogRecords_'+dt+'.csv"'
            writer = csv.writer(response)
            writer.writerow(['id','Customer','truck_id','mobilenumber','datastring',\
                            'utc_date','utc_time','status','latitiude','nsindicator',\
                            'longitude','ewindicator','sog','cog','mvd','mvv',\
                            'checksum','imsi','gsms','bs','gps_fix1','gps_fix2',\
                            'fuel','datachecksum'])
            reclist = Tvs_Truck_Data.objects.exclude(Q(info4=None)|Q(info5=\
                                        None)|Q(info6=None)).order_by('-id')[:records]
            for i in reclist:
                writer.writerow([i.id, i.info4.encode('utf-8'), \
                                i.info5.encode('utf-8'), \
                                i.info6.encode('utf-8'), i.info7,\
                                i.info16, i.info8, i.info9, i.info10, i.info11,\
                                i.info12, i.info13, i.info14, i.info15, i.info17,\
                                i.info18, i.info19, i.info20, i.info22, i.info23,\
                                i.info25, i.info21, i.info24, i.info26])
            return response
        else:
            return HttpResponse("Can not take more than 500 records")
    else:
        return HttpResponse("Invalid format!!!!")


@csrf_exempt
@check_customer_order_count
def tvs_operator_data(request):
    ship_list = []
    cid = request.GET.get('cid')
    order = request.GET.get('order')
    records = request.GET.get('records')
    ship_list = Tvs_Truck_Data.objects.filter(info4=cid)
    if ship_list:
        if order == 'asc':
            ship_list = ship_list.order_by('id')[:records]
        elif order == 'desc':
            ship_list = ship_list.order_by('-id')[:records]
        xml = render_to_string('operator_xml_template.xml', {'query_set': ship_list})
        return HttpResponse(xml,content_type="application/xml")
    else:
        return HttpResponse("No data for given customer!!!")



@csrf_exempt
def tvs_xml_client_data(request):
    if request.method == 'POST':
        count = 0
        cid = request.POST.get('cid')
        ckey = request.POST.get('ckey')
        check = Tvs_Xml_Data.objects.filter(customer_id= cid, customer_key = ckey).exists()
        if check and cid and ckey == 'QvsX2@er':
            txd = Tvs_Xml_Data.objects.filter(customer_id= cid, customer_key = ckey)
            if txd:
                txd = txd.order_by('-id')[0]
                ship_list = Tvs_Truck_Data.objects.filter(id__gt = \
                                    int(txd.last_id)).exclude(info2=None,info3=None,info4=None).order_by('id')
                count = ship_list.count()
                if ship_list:
                    lid = ship_list.latest('id').id
                else:
                    lid = txd.last_id
            txd_obj = Tvs_Xml_Data.objects.create(customer_id = cid , \
                                                customer_key = ckey,\
                                                created_on = datetime.datetime.now(),
                                                last_id = int(lid),
                                                no_of_records = int(count))
            xml = render_to_string('xml_client_template.xml', {'query_set': ship_list})
            return HttpResponse(xml,content_type="application/xml")
        else:
            return HttpResponse("Invalid Customer Id or Key")
    else:
        return HttpResponse("Invalid Request through GET")


def check_http_method_customer(view):

    def wrap_customer(request, *args, **kwargs):
        if request.method == 'GET':
            cid = request.GET.get('cid')
            if not cid:
                return HttpResponse('Pass Customer Id as cid')
        else:
            return HttpResponse("Invalid Request through POST")
        return view(request, *args, **kwargs)
    return wrap_customer


@csrf_exempt
@check_http_method_customer
def operator_latest_truck_data(request):
    ship_list, latest_list = [], []
    cid = request.GET.get('cid')
    ship_list = Tvs_Truck_Data.objects.filter(info4=cid)
    if ship_list:
        agg_list = ship_list.values('info5').annotate(tcount=Count('info5'))
        for i in agg_list:
            lt_obj = ship_list.filter(info5=i['info5']).latest('id')
            latest_list.append(lt_obj)
        ship_list = latest_list
    else:
        return HttpResponse("No data for given customer")
    xml = render_to_string('operator_latest_truck_data.xml', {'query_set': ship_list})
    return HttpResponse(xml,content_type="application/xml")
















