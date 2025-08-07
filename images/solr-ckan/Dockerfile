FROM bitnami/solr:9@sha256:f016b9607af3986dcdbc494318ba262562bf8fbd4ab863c28c3fb4c0cef0e3d2

EXPOSE 8983

# renovate: datasource=github-tags depName=ckan/ckan extractVersion=^ckan-(?<version>.*)$
ARG CKAN_TAG="2.11.3"

ENV SOLR_CONFIG_DIR="/opt/bitnami/solr/server/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/_default/conf/managed-schema"

USER root

# Add CKAN schema
ADD --chmod=644 https://raw.githubusercontent.com/ckan/ckan/ckan-${CKAN_TAG}/ckan/config/solr/schema.xml $SOLR_SCHEMA_FILE

USER 1001
