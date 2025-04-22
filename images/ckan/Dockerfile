FROM ckan/ckan-base:2.11.2@sha256:c823a90ea18f72e7a486e7c1062dbce24f031ef1f9e38aefb1831467044d08f6

# Copy custom initialization scripts

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

USER ckan