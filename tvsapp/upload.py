from tvsapp.models import *

""" , , utc_date = float(string[13]), magnetic_variation_deg = float(string[14]), magnetic_variation_value = string[15], checksum = string[16],mobile_subscriber_identity = string[17] + ',' + string[18], cell_id = string[19] + ',' + string[20],
            gsm_signal_stength = string[21], battery_remaining = string[22], gps_fix1 = string[23], gps_fix2 = string[24],
            fuel_remaining = string[25],truck_info_checksum = string[26]"""


def data_import():
    string = 'STX2010101801_j,ind-10-pun,tn02ad1234,919556312345,$GPRMC,101053.000,A,2232.7607,N,11404.7669,E,0.00,,231110,,,A*7F,460,00,2795,0E6A,14,94,1000,0000,91,Timer;1D'
    string = string.split(",")
    for i in range(0,20):
        Tvs_Truck_Data.objects.create(uid = string[0], cust_id = string[1], truck_id = string[2], mobile = string[3],
            data_string = string[4], utc_time = float(string[5]), status = string[6], latitude = float(string[7]),
                ns_indicator = string[8], longitude = float(string[9]),ew_indicator = string[10], speed_over_ground = float(string[11]),
                course_over_ground = 0,utc_date = float(string[13]), magnetic_variation_deg = 0, magnetic_variation_value = string[15], checksum = string[16],mobile_subscriber_identity = string[17] + ',' + string[18], cell_id = string[19] + ',' + string[20],
                gsm_signal_stength = string[21], battery_remaining = string[22], gps_fix1 = string[23], gps_fix2 = string[24],
                fuel_remaining = string[25],truck_info_checksum = string[26])
