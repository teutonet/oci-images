ARG OLD_PGVERSION=14
ARG PGVERSION=15

FROM ghcr.io/zalando/spilo-15:3.2-p1@sha256:5561dabb6cbe172a30220ff7ba517c4a20f74454f403072483eb62ac14e888bc AS extension-builder
# Build process requires installed postgres

ARG OLD_PGVERSION
ARG PGVERSION

ENV USE_PGXS=1

# git make clang llvm
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential unzip wget \
        postgresql-server-dev-${PGVERSION} postgresql-server-dev-${OLD_PGVERSION} libpq-dev clang-14 llvm-14

# IBAN validation
WORKDIR /iban
# fixed to latest commit on https://github.com/ol-teuto/PostgreSQL-IBAN/tree/refactor
# update git commit id here when that branch is updated
ARG POSTGRESQL_IBAN_VERSION=c836207bca039484f49328331a8e3c4876fbb4e6

RUN curl -sfLo iban.zip https://github.com/yorickdewid/PostgreSQL-IBAN/archive/${POSTGRESQL_IBAN_VERSION}.zip && \
    unzip iban.zip
RUN cd /iban/PostgreSQL-IBAN-${POSTGRESQL_IBAN_VERSION} && \
    make PG_CONFIG=/usr/lib/postgresql/${PGVERSION}/bin/pg_config clean all install && \
    make PG_CONFIG=/usr/lib/postgresql/${OLD_PGVERSION}/bin/pg_config clean all install

# renovate: datasource=github-tags depName=pgMemento/pgMemento extractVersion=^v(?<version>.*)$
ARG PGMEMENTO_VERSION=0.7.4

WORKDIR /pgmemento
RUN curl -sfLo pgmemento.zip https://github.com/pgMemento/pgMemento/releases/download/v${PGMEMENTO_VERSION}/pgmemento-${PGMEMENTO_VERSION}.zip && \
    unzip pgmemento.zip && \
    cd /pgmemento/pgmemento-${PGMEMENTO_VERSION} && \
    make && \
    make install

# json-schema validation
RUN mkdir -p /usr/local/share/postgres/extensions
# This repository does not have tags, so use a specific commit instead
RUN wget -O /usr/local/share/postgres/extensions/postgres-json-schema--0.1.1.sql https://raw.githubusercontent.com/gavinwahl/postgres-json-schema/570e19f5b2b4e6ff1414eebe2191e14c437760d9/postgres-json-schema--0.1.1.sql
RUN wget -O /usr/local/share/postgres/extensions/postgres-json-schema.control https://raw.githubusercontent.com/gavinwahl/postgres-json-schema/570e19f5b2b4e6ff1414eebe2191e14c437760d9/postgres-json-schema.control

FROM ghcr.io/zalando/spilo-15:3.2-p1@sha256:5561dabb6cbe172a30220ff7ba517c4a20f74454f403072483eb62ac14e888bc AS final
# Setup final image with extensions

ARG PGVERSION
ARG OLD_PGVERSION

# json-schema validation
COPY --from=extension-builder /usr/local/share/postgres/extensions/postgres-json-schema* /usr/share/postgresql/${OLD_PGVERSION}/extension/
COPY --from=extension-builder /usr/local/share/postgres/extensions/postgres-json-schema* /usr/share/postgresql/${PGVERSION}/extension/

# pgmemento (audit trail)
COPY --from=extension-builder /usr/share/postgresql/${PGVERSION}/extension/pgmemento* /usr/share/postgresql/${OLD_PGVERSION}/extension/
COPY --from=extension-builder /usr/share/postgresql/${PGVERSION}/extension/pgmemento* /usr/share/postgresql/${PGVERSION}/extension/

# iban
COPY --from=extension-builder /usr/share/postgresql/${OLD_PGVERSION}/extension/iban* /usr/share/postgresql/${OLD_PGVERSION}/extension/
COPY --from=extension-builder /usr/lib/postgresql/${OLD_PGVERSION}/lib/iban.so /usr/lib/postgresql/${OLD_PGVERSION}/lib/iban.so
COPY --from=extension-builder /usr/lib/postgresql/${OLD_PGVERSION}/lib/bitcode/iban.index.bc /usr/lib/postgresql/${OLD_PGVERSION}/lib/bitcode/iban.index.bc
COPY --from=extension-builder /usr/lib/postgresql/${OLD_PGVERSION}/lib/bitcode/iban/ /usr/lib/postgresql/${OLD_PGVERSION}/lib/bitcode/iban/
COPY --from=extension-builder /usr/share/postgresql/${PGVERSION}/extension/iban* /usr/share/postgresql/${PGVERSION}/extension/
COPY --from=extension-builder /usr/lib/postgresql/${PGVERSION}/lib/iban.so /usr/lib/postgresql/${PGVERSION}/lib/iban.so
COPY --from=extension-builder /usr/lib/postgresql/${PGVERSION}/lib/bitcode/iban.index.bc /usr/lib/postgresql/${PGVERSION}/lib/bitcode/iban.index.bc
COPY --from=extension-builder /usr/lib/postgresql/${PGVERSION}/lib/bitcode/iban/ /usr/lib/postgresql/${PGVERSION}/lib/bitcode/iban/
