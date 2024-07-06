FROM bitnami/solr:9@sha256:46e37816994054b2f90d5222877bcd789c92e3747e4d1b9d700ac2195890141e

EXPOSE 8983

ARG CKAN_BRANCH="ckan-2.10.4"

ENV SOLR_CONFIG_DIR="/opt/bitnami/solr/server/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/ckan/conf/managed-schema"

USER root

# Create a CKAN configset by copying the default one
RUN cp -R $SOLR_CONFIG_DIR/_default $SOLR_CONFIG_DIR/ckan

# Update the schema
ADD --chmod=644 https://raw.githubusercontent.com/ckan/ckan/$CKAN_BRANCH/ckan/config/solr/schema.xml $SOLR_SCHEMA_FILE

USER 1001
