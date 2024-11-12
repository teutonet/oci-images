FROM ckan/ckan-base:2.11.0@sha256:25f62915e2603fdeed0423cc04d89fb7cd57223fe06a09602360a94203d270b7

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples

# Copy custom initialization scripts
COPY docker-entrypoint.d/* /docker-entrypoint.d/

COPY setup/prerun.py.override ${APP_DIR}/prerun.py
COPY setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

RUN chown -R ckan /srv/app/

USER ckan