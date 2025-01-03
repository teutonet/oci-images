FROM ckan/ckan-base:2.11.1@sha256:9289933fc4e1cb4beee5a1a4f6a4444a3ccdfac4ae6e62c579066b9f5b4a25cf

USER root

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples
RUN pip3 install -e git+https://github.com/ckan/ckanext-dcat.git@v1.7.0#egg=ckanext-dcat
RUN pip install -r ${SRC_DIR}/ckanext-dcat/requirements.txt

RUN pip install -e git+https://github.com/ckan/ckanext-harvest.git@v1.6.0#egg=ckanext-harvest
RUN pip install -r ${SRC_DIR}/ckanext-harvest/requirements.txt

RUN pip3 install -e git+https://github.com/GovDataOfficial/ckanext-dcatde.git@6.8.3#egg=ckanext-dcatde
RUN cd ${SRC_DIR}/ckanext-dcatde \
    pip install -r base-requirements.txt -f requirements \
    python setup.py develop

# Copy custom initialization scripts
COPY --chown=ckan:ckan-sys docker-entrypoint.d/02_setup_dcat.sh /docker-entrypoint.d/02_setup_dcat.sh

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

RUN chown -R ckan /srv/app/

USER ckan