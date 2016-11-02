from django.contrib import admin
from tvsapp.models import *

class UserPermission(admin.ModelAdmin):

    def has_add_permission(self, request, obj=None):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

class TvsTruckDataAdmin(UserPermission):
    readonly_fields = Tvs_Truck_Data._meta.get_all_field_names()
    list_select_related = True
    list_display = ('info2', 'info3', 'info4','info5','info6','info7')
    search_fields = ['info2', 'info3', 'info4', 'info5', 'info6']


admin.site.register(Tvs_Truck_Data, TvsTruckDataAdmin)
admin.site.register(Tvs_Xml_Data)
admin.site.register(Tvs_Truck_Data_As_Raw)
