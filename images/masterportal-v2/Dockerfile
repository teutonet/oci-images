FROM nginx:1.29.0-alpine@sha256:d67ea0d64d518b1bb04acde3b00f722ac3e9764b3209a9b0a98924ba35e4b779

# renovate: datasource=bitbucket-tags depName=geowerkstatt-hamburg/masterportal extractVersion=^v(?<version>2.*)$
ENV MASTERPORTAL_VERSION=2.52.0

# download and restructure Masterportal
RUN curl -fsLw "status %{http_code}, size: %{size_download}" \
    -o /tmp/masterportal.zip \
    https://bitbucket.org/geowerkstatt-hamburg/masterportal/downloads/examples-$MASTERPORTAL_VERSION.zip \
    && unzip -d /tmp/masterportal /tmp/masterportal.zip \
    && rm -v /tmp/masterportal.zip \
    && mv /tmp/masterportal/Basic /usr/share/nginx/html/upstream \
    && mv /tmp/masterportal/mastercode/* /usr/share/nginx/html/upstream/mastercode \
    && rmdir /tmp/masterportal/mastercode /tmp/masterportal \
    && sed -i 's#\.\./mastercode/[^/]*/#./mastercode/#g' /usr/share/nginx/html/upstream/index.html \
    && sed -i '/const Config = {/a \    cesiumLibrary: "https://cesium.com/downloads/cesiumjs/releases/1.95/Build/Cesium/Cesium.js",' /usr/share/nginx/html/upstream/config.js

# layer git-sync volume over upstream
# rewrite the hard-coded version number in some paths to reduce the necessary changes to overlays for updates
# direct the client to let the server confirm that the cached files are still up to date every time, this should solve the stale cache problems that are exacerbated by the rewrite rule but existed anyway
# this configuration is done as a modification instead of a copied file to pick up new default settings after updates
RUN sed -i 's#location / {#\0 add_header Cache-Control no-cache; rewrite ^/$ /index.html; rewrite ^/mastercode/'`printf %s "$MASTERPORTAL_VERSION" | sed 's/\./_/g'`'/(.*)$ /mastercode/$1; try_files /synced/current/$uri /upstream/$uri =404;#' /etc/nginx/conf.d/default.conf

# use tmp files and other port to allow running as non-root user as per https://hub.docker.com/_/nginx
RUN sed -i 's#pid .*#pid /tmp/nginx.pid;#' /etc/nginx/nginx.conf \
 && for i in client_body proxy fastcgi uwsgi scgi; do sed -i "s#http {#\\0 ${i}_temp_path /tmp/${i}_temp;#" /etc/nginx/nginx.conf || exit 1; done \
 && sed -i 's#listen \+80#listen 8080#' /etc/nginx/conf.d/default.conf
