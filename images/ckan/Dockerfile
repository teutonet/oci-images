FROM ckan/ckan-base:2.11.5@sha256:0bf06c0d05a761696295247a63ce01846b6798febe6ebb91288e29120de102be

# Copy custom initialization scripts

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

USER ckan