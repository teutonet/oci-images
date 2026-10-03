FROM ckan/ckan-base:2.12.0@sha256:87ecf3f27ad69b736e4a9e6f580e67d328e729f34e1486a0a5ae392f267d0675

# Copy custom initialization scripts

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

USER ckan