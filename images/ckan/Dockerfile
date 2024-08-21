FROM ckan/ckan-base:2.11.0@sha256:33a49f512715d5aaf4290ed47015e7308873dd8e56364613ee303b022a37fba4

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples

# Copy custom initialization scripts
COPY docker-entrypoint.d/* /docker-entrypoint.d/

COPY setup/prerun.py.override ${APP_DIR}/prerun.py

RUN chown -R ckan /srv/app/

USER ckan