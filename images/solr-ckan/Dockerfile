FROM bitnami/solr:9@sha256:9c0218ef234fe356acc34d0d8ac07598fab30b3f19a96a3ba8e8107d94b9550b

EXPOSE 8983

ARG CKAN_BRANCH="ckan-2.10.4"

ENV SOLR_CONFIG_DIR="/opt/bitnami/solr/server/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/_default/conf/managed-schema"

USER root

# Add CKAN schema
ADD --chmod=644 https://raw.githubusercontent.com/ckan/ckan/$CKAN_BRANCH/ckan/config/solr/schema.xml $SOLR_SCHEMA_FILE

USER 1001
