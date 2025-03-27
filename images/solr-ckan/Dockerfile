FROM bitnami/solr:9@sha256:3c281543265557c6eb588f7d9d89d63029e40d7e27baf5aa72649320dc1a48f2

EXPOSE 8983

ARG CKAN_BRANCH="ckan-2.10.4"

ENV SOLR_CONFIG_DIR="/opt/bitnami/solr/server/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/_default/conf/managed-schema"

USER root

# Add CKAN schema
ADD --chmod=644 https://raw.githubusercontent.com/ckan/ckan/$CKAN_BRANCH/ckan/config/solr/schema.xml $SOLR_SCHEMA_FILE

USER 1001
