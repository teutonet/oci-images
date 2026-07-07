FROM archlinux:multilib-devel@sha256:080cec97ea7d6193de4180e52513b042baf4a3bd28987bcbbe580bb902371734

RUN pacman -Syyu --noconfirm && \
    pacman-db-upgrade && \
    pacman -S --needed --noconfirm base-devel

RUN useradd -ms /bin/bash -u 1001 runner && \
    groupadd --gid 123 docker && \
    usermod -aG docker runner && \
    echo "runner ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/runner && \
    chmod 777 /home/runner

USER runner
WORKDIR /home/runner

ADD --chown=runner:runner https://aur.archlinux.org/yay-bin.git#master /tmp/yay
RUN env -C /tmp/yay makepkg -sci --noconfirm

RUN yay -S --noconfirm \
    jq \
    moreutils \
    parallel \
    yq \
    kubectl \
    helm \
    chart-testing \
    helm-unittest-bin \
    pluto-bin \
    kubescape-bin \
    unzip

# renovate: datasource=github-releases depName=actions/runner extractVersion=^v(?<version>.*)$
ARG RUNNER_VERSION=2.335.1
RUN curl -fL -o runner.tar.gz "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz" && \
    tar xzf runner.tar.gz && \
    rm runner.tar.gz

# renovate: datasource=github-releases depName=actions/runner-container-hooks extractVersion=^v(?<version>.*)$
ARG RUNNER_CONTAINER_HOOKS_VERSION=0.8.1
RUN curl -fL -o runner-container-hooks.zip "https://github.com/actions/runner-container-hooks/releases/download/v${RUNNER_CONTAINER_HOOKS_VERSION}/actions-runner-hooks-k8s-${RUNNER_CONTAINER_HOOKS_VERSION}.zip" && \
    unzip runner-container-hooks.zip -d k8s && \
    rm runner-container-hooks.zip

ENV RUNNER_MANUALLY_TRAP_SIG=1
ENV ACTIONS_RUNNER_PRINT_LOG_TO_STDOUT=1
ENV HELM_PLUGINS=/usr/lib/helm/plugins
