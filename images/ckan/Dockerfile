FROM ckan/ckan-base:2.11.0@sha256:bae3f94276dcdb38bb1d9674604b3515e24831a5207040d50580e6ef2d0749af

# Copy custom initialization scripts

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

USER ckan