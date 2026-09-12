FROM ckan/ckan-base:2.12.0@sha256:87ecf3f27ad69b736e4a9e6f580e67d328e729f34e1486a0a5ae392f267d0675

USER root

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples

# renovate: datasource=github-tags depName=ckan/ckanext-dcat extractVersion=^v(?<version>.*)$
ARG CKANEXT_DCAT_VERSION=1.7.0

RUN pip3 install -e git+https://github.com/ckan/ckanext-dcat.git@v${CKANEXT_DCAT_VERSION}#egg=ckanext-dcat
RUN pip install -r ${SRC_DIR}/ckanext-dcat/requirements.txt

# renovate: datasource=github-tags depName=ckan/ckanext-harvest extractVersion=^v(?<version>.*)$
ARG CKANEXT_HARVEST_VERSION=1.6.2

RUN pip install -e git+https://github.com/ckan/ckanext-harvest.git@v${CKANEXT_HARVEST_VERSION}#egg=ckanext-harvest
RUN pip install -r ${SRC_DIR}/ckanext-harvest/requirements.txt

# renovate: datasource=github-tags depName=GovDataOfficial/ckanext-dcatde
ARG CKANEXT_DCATDE_VERSION=6.10.0

RUN pip3 install -e git+https://github.com/GovDataOfficial/ckanext-dcatde.git@${CKANEXT_DCATDE_VERSION}#egg=ckanext-dcatde
RUN cd ${SRC_DIR}/ckanext-dcatde \
    pip install -r base-requirements.txt -f requirements \
    python setup.py develop

# Copy custom initialization scripts
COPY --chown=ckan:ckan-sys docker-entrypoint.d/02_setup_dcat.sh /docker-entrypoint.d/02_setup_dcat.sh

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

RUN chown -R ckan /srv/app/

USER ckan