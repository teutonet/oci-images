FROM ckan/ckan-base:2.11.0@sha256:0641aadfda75885a1ff1e84f47b0772544c392533e4e7cae9e739fda7923986c

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples

# Copy custom initialization scripts
COPY docker-entrypoint.d/* /docker-entrypoint.d/

COPY setup/prerun.py.override ${APP_DIR}/prerun.py

RUN chown -R ckan /srv/app/

USER ckan