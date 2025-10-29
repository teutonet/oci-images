FROM ckan/ckan-base:2.11.4@sha256:22139325158d49473d910d60256a7dc8437795949bf72507a90f3510f9065438

# Copy custom initialization scripts

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

USER ckan