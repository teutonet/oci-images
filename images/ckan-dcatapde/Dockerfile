FROM ckan/ckan-base:2.11.0@sha256:33a49f512715d5aaf4290ed47015e7308873dd8e56364613ee303b022a37fba4

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples
RUN pip3 install -e git+https://github.com/ckan/ckanext-dcat.git@v1.6.0#egg=ckanext-dcat
RUN pip install -r ${SRC_DIR}/ckanext-dcat/requirements.txt

RUN pip install -e git+https://github.com/ckan/ckanext-harvest.git@v1.5.6#egg=ckanext-harvest
RUN pip install -r ${SRC_DIR}/ckanext-harvest/requirements.txt

RUN pip3 install -e git+https://github.com/GovDataOfficial/ckanext-dcatde.git@6.7.0#egg=ckanext-dcatde
RUN cd ${SRC_DIR}/ckanext-dcatde \
    pip install -r base-requirements.txt -f requirements \
    python setup.py develop

# Copy custom initialization scripts
COPY docker-entrypoint.d/* /docker-entrypoint.d/

COPY setup/prerun.py.override ${APP_DIR}/prerun.py

RUN chown -R ckan /srv/app/

USER ckan