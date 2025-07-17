FROM bitnami/solr:9@sha256:23a14378b0c95d08e121957b609583c8f199afe752045cda8577acea470b0c3a

EXPOSE 8983

# renovate: datasource=github-tags depName=ckan/ckan extractVersion=^ckan-(?<version>.*)$
ARG CKAN_TAG="2.11.3"

ENV SOLR_CONFIG_DIR="/opt/bitnami/solr/server/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/_default/conf/managed-schema"

USER root

# Add CKAN schema
ADD --chmod=644 https://raw.githubusercontent.com/ckan/ckan/ckan-${CKAN_TAG}/ckan/config/solr/schema.xml $SOLR_SCHEMA_FILE

USER 1001
