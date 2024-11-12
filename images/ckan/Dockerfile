FROM ckan/ckan-base:2.11.0@sha256:dc32715660e76e11d770a157440383a363255430ac7fd64c87ddf68bffa37d06

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples

# Copy custom initialization scripts
COPY docker-entrypoint.d/* /docker-entrypoint.d/

COPY setup/prerun.py.override ${APP_DIR}/prerun.py
COPY setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

RUN chown -R ckan /srv/app/

USER ckan