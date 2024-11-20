FROM ckan/ckan-base:2.11.0@sha256:5a97b864165f713a6155ad27cf9c4114d952e4808c35c94242239c03358a4b31

# Copy custom initialization scripts

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

USER ckan