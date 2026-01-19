FROM ghcr.io/cloudnative-pg/postgis:18.1-3.6.1-system-trixie@sha256:6c41361933f837a99ca5d023b2709f4c2caa01c276325b232af5e07d2c398bf3 AS base

ARG PG_MAJOR=16

FROM base AS extension-builder

USER root

ENV USE_PGXS=1

# git make clang llvm
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential unzip wget \
        postgresql-server-dev-$PG_MAJOR libpq-dev clang llvm

# IBAN validation
WORKDIR /iban
# fixed to latest commit on https://github.com/ol-teuto/PostgreSQL-IBAN/tree/refactor
# update git commit id here when that branch is updated
ARG POSTGRESQL_IBAN_VERSION=c836207bca039484f49328331a8e3c4876fbb4e6

RUN wget -O iban.zip https://github.com/yorickdewid/PostgreSQL-IBAN/archive/${POSTGRESQL_IBAN_VERSION}.zip && \
    unzip iban.zip
RUN cd /iban/PostgreSQL-IBAN-${POSTGRESQL_IBAN_VERSION} && \
    make clean all install

# renovate: datasource=github-tags depName=pgMemento/pgMemento extractVersion=^v(?<version>.*)$
ARG PGMEMENTO_VERSION=0.7.4

WORKDIR /pgmemento
RUN wget -O pgmemento.zip https://github.com/pgMemento/pgMemento/releases/download/v${PGMEMENTO_VERSION}/pgmemento-${PGMEMENTO_VERSION}.zip && \
    unzip pgmemento.zip && \
    cd /pgmemento/pgmemento-${PGMEMENTO_VERSION} && \
    make && \
    make install

# json-schema validation
RUN mkdir -p /usr/local/share/postgres/extensions
# This repository does not have tags, so use a specific commit instead
RUN wget -O /usr/local/share/postgres/extensions/postgres-json-schema--0.1.1.sql https://raw.githubusercontent.com/gavinwahl/postgres-json-schema/570e19f5b2b4e6ff1414eebe2191e14c437760d9/postgres-json-schema--0.1.1.sql
RUN wget -O /usr/local/share/postgres/extensions/postgres-json-schema.control https://raw.githubusercontent.com/gavinwahl/postgres-json-schema/570e19f5b2b4e6ff1414eebe2191e14c437760d9/postgres-json-schema.control

FROM base AS final

# json-schema validation
COPY --from=extension-builder /usr/local/share/postgres/extensions/postgres-json-schema* /usr/share/postgresql/$PG_MAJOR/extension/

# pgmemento (audit trail)
COPY --from=extension-builder /usr/share/postgresql/$PG_MAJOR/extension/pgmemento* /usr/share/postgresql/$PG_MAJOR/extension/

# iban
COPY --from=extension-builder /usr/share/postgresql/$PG_MAJOR/extension/iban* /usr/share/postgresql/$PG_MAJOR/extension/
COPY --from=extension-builder /usr/lib/postgresql/$PG_MAJOR/lib/iban.so /usr/lib/postgresql/$PG_MAJOR/lib/iban.so
COPY --from=extension-builder /usr/lib/postgresql/$PG_MAJOR/lib/bitcode/iban.index.bc /usr/lib/postgresql/$PG_MAJOR/lib/bitcode/iban.index.bc
COPY --from=extension-builder /usr/lib/postgresql/$PG_MAJOR/lib/bitcode/iban/ /usr/lib/postgresql/$PG_MAJOR/lib/bitcode/iban/
