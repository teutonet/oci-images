FROM ckan/ckan-base:2.11.1@sha256:9289933fc4e1cb4beee5a1a4f6a4444a3ccdfac4ae6e62c579066b9f5b4a25cf

# Copy custom initialization scripts

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

USER ckan