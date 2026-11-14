FROM ckan/ckan-base:2.12.1@sha256:da036b38a31f1e35c87ba1b099dd78d53c02e6585beafdac2cfe963571499c1c

# Copy custom initialization scripts

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

USER ckan