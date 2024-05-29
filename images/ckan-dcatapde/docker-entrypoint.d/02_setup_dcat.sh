#!/bin/bash

if [[ $CKAN__PLUGINS == *"dcatde"* ]]; then
   # Datapusher settings have been configured in the .env file
   # Set API token if necessary
    echo "Set up ckan.datapusher.api_token in the CKAN config file"
    ckan config-tool $CKAN_INI "ckanext.dcat.rdf.profiles = euro_dcat_ap_2 dcatap_de"
    ckan config-tool $CKAN_INI "ckanext.dcatde.harvest.default_license = http://dcat-ap.de/def/licenses/other-closed"
    ckan config-tool $CKAN_INI "ckanext.dcatde.urls.themes = file:///srv/app/src/ckanext-dcatde/examples/dcat_theme.json"
    ckan config-tool $CKAN_INI "ckanext.dcatde.urls.license_mapping = file:///srv/app/src/ckanext-dcatde/examples/dcat_license_mapping.json"
    ckan config-tool $CKAN_INI "ckanext.dcatde.urls.category_mapping = file:///srv/app/src/ckanext-dcatde/examples/category_mapping.json"
    ckan config-tool $CKAN_INI "licenses_group_url = file:///srv/app/src/ckanext-dcatde/examples/dcat_licenses.json"
    ckan config-tool $CKAN_INI "ckanext.dcat.resource.inherit.license = True"
    ckan config-tool $CKAN_INI "ckan.harvest.mq.type = redis"
    ckan -c $CKAN_INI "dcatde_themeadder"
else
   echo "Not configuring Dcat-AP.de"
fi
