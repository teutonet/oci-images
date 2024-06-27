FROM ckan/ckan-base:2.10.4@sha256:83f67f488d7bd33eacd6a02a320cb9cb8be02954887fe03fd6d194a038ff303a

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples

# Copy custom initialization scripts
COPY docker-entrypoint.d/* /docker-entrypoint.d/

COPY setup/prerun.py.override ${APP_DIR}/prerun.py

RUN chown -R ckan /srv/app/

USER ckan