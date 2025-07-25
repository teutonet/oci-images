FROM bitnami/solr:9@sha256:7a7d839c2361c4fead4c60a6fea2d8c2bdd0dc3e81012541c997e2ac3c87c470

EXPOSE 8983

# renovate: datasource=github-tags depName=ckan/ckan extractVersion=^ckan-(?<version>.*)$
ARG CKAN_TAG="2.11.3"

ENV SOLR_CONFIG_DIR="/opt/bitnami/solr/server/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/_default/conf/managed-schema"

USER root

# Add CKAN schema
ADD --chmod=644 https://raw.githubusercontent.com/ckan/ckan/ckan-${CKAN_TAG}/ckan/config/solr/schema.xml $SOLR_SCHEMA_FILE

USER 1001
