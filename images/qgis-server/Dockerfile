FROM debian:bookworm-slim@sha256:df52e55e3361a81ac1bead266f3373ee55d29aa50cf0975d440c2be3483d8ed3

ENV LANG=en_EN.UTF-8

# renovate: datasource=github-tags depName=krallin/tini
ENV TINI_VERSION=v0.19.0

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        gnupg \
        ca-certificates \
        wget \
        locales \
        crudini \
    && localedef -i en_US -f UTF-8 en_US.UTF-8 \
    # Add the current key for package downloading
    # Please refer to QGIS install documentation (https://www.qgis.org/fr/site/forusers/alldownloads.html#debian-ubuntu)
    && mkdir -m755 -p /etc/apt/keyrings \
    && wget -O /etc/apt/keyrings/qgis-archive-keyring.gpg https://download.qgis.org/downloads/qgis-archive-keyring.gpg \
    # Add repository for latest version of qgis-server
    # Please refer to QGIS repositories documentation if you want other version (https://qgis.org/en/site/forusers/alldownloads.html#repositories)
    && echo "deb [signed-by=/etc/apt/keyrings/qgis-archive-keyring.gpg] https://qgis.org/debian bookworm main" | tee /etc/apt/sources.list.d/qgis.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        qgis-server \
        spawn-fcgi \
        xauth \
        xvfb \
    && wget -O /tini https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini \
    && chmod +x /tini \
    && apt-get remove --purge -y \
        gnupg \
        wget \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m qgis

ENV QGIS_PREFIX_PATH=/usr
ENV QGIS_SERVER_LOG_STDERR=1
ENV QGIS_SERVER_LOG_LEVEL=2
ENV QGIS_PLUGINPATH=/plugins

COPY validmap/ /plugins/validmap/

COPY cmd.sh /home/qgis/cmd.sh
RUN mkdir /etc/postgresql-common/ && chmod 777 /etc/postgresql-common/

USER qgis
WORKDIR /home/qgis

ENTRYPOINT ["/tini", "--"]

CMD ["/home/qgis/cmd.sh"]
