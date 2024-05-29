FROM ckan/ckan-base:2.10.4

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples

# Copy custom initialization scripts
COPY docker-entrypoint.d/* /docker-entrypoint.d/

COPY setup/prerun.py.override ${APP_DIR}/prerun.py

RUN chown -R ckan /srv/app/

USER ckan