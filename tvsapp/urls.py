from django.conf.urls import patterns, include, url


urlpatterns = patterns('',
    url(r'^tvs-data/$', 'tvsapp.views.tvs_xml_data', name="tvs_xml_data"),
#    url(r'^tvs-xml-data/$', 'tvsapp.views.tvs_xml_post_data', name="tvs_xml_post_data"),
#    url(r'^tvs-xml-data-check/$', 'tvsapp.views.tvs_xml_post_data_check', name="tvs_xml_post_data_check"),
    url(r'^tvs-xml-get-data/$', 'tvsapp.views.tvs_xml_get_data', name="tvs_xml_get_data"),
    url(r'^tvs-xml-client-data/$', 'tvsapp.views.tvs_xml_client_data', name="tvs_xml_client_data"),
    url(r'^tvs-xml-structure/$', 'tvsapp.views.tvs_xml_structure', name="tvs_xml_structure"),
    url(r'^tvs-xml-zone-data/$', 'tvsapp.views.tvs_zone_data', name="tvs_xml_zone_data"),
    url(r'get-csv-data/$','tvsapp.views.get_csv_data',name="get_csv_data"),
    url(r'^operator-data/$', 'tvsapp.views.tvs_operator_data', name="tvs_operator_data"),
    url(r'^operator-latest-truck-data/$', 'tvsapp.views.operator_latest_truck_data', name="operator_latest_truck_data"),
)
