FROM bitnami/solr:9@sha256:393ac82781e63caa1be7ed3c7407ca18ffac06d624b65e8958322ac50c24efe4

EXPOSE 8983

ARG CKAN_BRANCH="ckan-2.10.4"

ENV SOLR_CONFIG_DIR="/opt/bitnami/solr/server/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/_default/conf/managed-schema"

USER root

# Add CKAN schema
ADD --chmod=644 https://raw.githubusercontent.com/ckan/ckan/$CKAN_BRANCH/ckan/config/solr/schema.xml $SOLR_SCHEMA_FILE

USER 1001
