FROM ckan/ckan-base:2.11.2@sha256:47370559b461e4629b9f48fd36393e2e622816a19b5fc72c16c38073ef2ea7d5

# Copy custom initialization scripts

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

USER ckan