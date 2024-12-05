FROM ckan/ckan-base:2.11.0@sha256:2040c4b3de7e5b7c72b018e8b618f8a3571ceb293164ace51fe67daa408db067

# Copy custom initialization scripts

COPY --chown=ckan:ckan-sys setup/prerun.py.override ${APP_DIR}/prerun.py
COPY --chown=ckan:ckan-sys setup/start_ckan.sh.override ${APP_DIR}/start_ckan.sh

USER ckan