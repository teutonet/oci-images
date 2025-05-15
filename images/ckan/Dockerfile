FROM ckan/ckan-base:2.11.3@sha256:19be56ca09ba85986da54471f6c8ac065fbc6f84d7b019bad21cacd17eafd5a6

# Copy custom initialization scripts

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

USER ckan