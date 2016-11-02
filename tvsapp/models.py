from django.db import models

class Tvs_Truck_Data(models.Model):
    info1 = models.CharField(max_length = 100,blank = True, null = True)
    info2 = models.CharField(max_length = 100,blank = True, null = True)
    info3 = models.CharField(max_length = 100,blank = True, null = True)
    info4 = models.CharField(max_length = 100,blank = True, null = True)
    info5 = models.CharField(max_length = 100,blank = True, null = True)
    info6 = models.CharField(max_length = 100,blank = True, null = True)
    info7 = models.CharField(max_length = 100,blank = True, null = True)
    info8 = models.CharField(max_length = 100,blank = True, null = True)
    info9 = models.CharField(max_length = 100,blank = True, null = True)
    info10 = models.CharField(max_length = 100,blank = True, null = True)
    info11 = models.CharField(max_length = 100,blank = True, null = True)
    info12 = models.CharField(max_length = 100,blank = True, null = True)
    info13 = models.CharField(max_length = 100,blank = True, null = True)
    info14 = models.CharField(max_length = 100,blank = True, null = True)
    info15 = models.CharField(max_length = 100,blank = True, null = True)
    info16 = models.CharField(max_length = 100,blank = True, null = True)
    info17 = models.CharField(max_length = 100,blank = True, null = True)
    info18 = models.CharField(max_length = 100,blank = True, null = True)
    info19 = models.CharField(max_length = 100,blank = True, null = True)
    info20 = models.CharField(max_length = 100,blank = True, null = True)
    info21 = models.CharField(max_length = 100,blank = True, null = True)
    info22 = models.CharField(max_length = 100,blank = True, null = True)
    info23 = models.CharField(max_length = 100,blank = True, null = True)
    info24 = models.CharField(max_length = 100,blank = True, null = True)
    info25 = models.CharField(max_length = 100,blank = True, null = True)
    info26 = models.CharField(max_length = 100,blank = True, null = True)
    info27 = models.CharField(max_length = 100,blank = True, null = True)

    """
    def get_latitude(self):
        try:
            lat = str(self.info10)
            new_lat = lat[:2]+ "." + lat[2:].replace('.','')
        except:
            new_lat = ''
        return new_lat
    """

    """
    def get_longitude(self):
        try:
            lgt = str(self.info12)
            lgt = lgt[1:]
            new_lgt = lgt[:2] + "." + lgt[2:].replace('.','')
        except:
            new_lgt = ''
        return new_lgt
    """

    def get_latitude(self):
        try:
            lat = str(self.info10)
            res = float(lat[2:])/60
            res1 = str(res)
            temp_res = res1.split('.')
            temp_res[0] = lat[:2]
            new_lat = ".".join(temp_res)
        except:
            new_lat = ''
        return new_lat

    def get_longitude(self):
        try:
            lgt = str(self.info12)
            lgt = lgt[1:]
            res = float(lgt[2:])/60
            res1 = str(res)
            temp_list = res1.split('.')
            temp_list[0] = lgt[:2]
            new_lgt = ".".join(temp_list)
        except:
            new_lgt = ''
        return new_lgt

    def get_date(self):
        try:
            dt = str(self.info16)
            new_dt = "20" + dt[4:6] + "-" + dt[2:4] + "-" + dt[0:2]
        except:
            new_dt = ''
        return new_dt

    def get_time(self):
        try:
            tm = str(self.info8)
            new_tm = tm[:2] + ":" + tm[2:4] +":" + tm[4:6]
        except:
            new_tm = ''
        return new_tm

    def get_uid(self):
        try:
            #uid = self.info3.split(' ')[0]
            uid = ''.join(e for e in self.info3 if e.isalnum())
        except:
            uid = ''
        return uid

    def get_mobile_imei(self):
        try:
            imei = ''.join(e for e in self.info3 if e.isdigit())
        except:
            imei = ''
        return imei

    def get_check_sum(self):
        try:
            csum = self.info26.split(';')[1]
        except:
            csum = 0
        return csum

    def get_customer_id(self):
        try:
            cid = self.info4.__str__()
        except:
            cid = None
        return cid

    def get_truck_id(self):
        try:
            tid = self.info5.__str__()
        except:
            tid = None
        return tid

    def get_mobile_number(self):
        try:
            mn = self.info6.__str__()
        except:
            mn = None
        return mn

class Tvs_Xml_Data(models.Model):
    customer_id = models.CharField(max_length = 100)
    customer_key = models.CharField(max_length = 100)
    truck_id = models.CharField(max_length = 100, blank = True, null = True)
    created_on = models.DateTimeField()
    last_id = models.IntegerField()
    no_of_records = models.IntegerField(default = 0)


class Tvs_Truck_Data_As_Raw(models.Model):
    info1 = models.CharField(max_length = 100,blank = True, null = True)
    info2 = models.CharField(max_length = 100,blank = True, null = True)
    info3 = models.CharField(max_length = 100,blank = True, null = True)
    info4 = models.CharField(max_length = 100,blank = True, null = True)
    info5 = models.CharField(max_length = 100,blank = True, null = True)
    info6 = models.CharField(max_length = 100,blank = True, null = True)
    info7 = models.CharField(max_length = 100,blank = True, null = True)
    info8 = models.CharField(max_length = 100,blank = True, null = True)
    info9 = models.CharField(max_length = 100,blank = True, null = True)
    info10 = models.CharField(max_length = 100,blank = True, null = True)
    info11 = models.CharField(max_length = 100,blank = True, null = True)
    info12 = models.CharField(max_length = 100,blank = True, null = True)
    info13 = models.CharField(max_length = 100,blank = True, null = True)
    info14 = models.CharField(max_length = 100,blank = True, null = True)
    info15 = models.CharField(max_length = 100,blank = True, null = True)
    info16 = models.CharField(max_length = 100,blank = True, null = True)
    info17 = models.CharField(max_length = 100,blank = True, null = True)
    info18 = models.CharField(max_length = 100,blank = True, null = True)
    info19 = models.CharField(max_length = 100,blank = True, null = True)
    info20 = models.CharField(max_length = 100,blank = True, null = True)
    info21 = models.CharField(max_length = 100,blank = True, null = True)
    info22 = models.CharField(max_length = 100,blank = True, null = True)
    info23 = models.CharField(max_length = 100,blank = True, null = True)
    info24 = models.CharField(max_length = 100,blank = True, null = True)
    info25 = models.CharField(max_length = 100,blank = True, null = True)
    info26 = models.CharField(max_length = 100,blank = True, null = True)
    info27 = models.CharField(max_length = 100,blank = True, null = True)



