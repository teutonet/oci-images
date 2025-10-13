FROM archlinux:multilib-devel@sha256:9f6f04ef67cea4f618e10c45817c50dbd7e575bddff5fa4d71a38ac55bcc781b
LABEL MAINTAINER="teuto.net"
LABEL version="1.0"
LABEL description="A small image with necessary tools for the k8s course"

USER root
# Update and installation of tools
RUN pacman -Syyu --noconfirm
RUN pacman-db-upgrade
RUN sudo pacman -Syu --needed --noconfirm base-devel
RUN useradd -ms /bin/bash k8s
RUN echo "k8s ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/k8s
USER k8s
WORKDIR /home/k8s
ADD --chown=k8s:k8s https://aur.archlinux.org/paru-bin.git#master /tmp/paru
RUN cd /tmp/paru \
  && makepkg -si --noconfirm
RUN paru -S --noconfirm neovim git k9s kubectl jq npm yq fluxcd k9s-flux helm helm-diff helmrelease-tools

# configure nvim plugins
RUN git clone https://github.com/LazyVim/starter ~/.config/nvim \
  && rm -rf ~/.config/nvim/.git
COPY <<EOF /home/k8s/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    ---@module "lazyvim"
    ---@type PluginLspOpts
    opts = {
      ---@module "lspconfig.configs"
      ---@type table<string, lspconfig.Config>
      servers = {
        yamlls = {
          before_init = function(_, config)
            vim.tbl_deep_extend("force", config, { settings = { yaml = { keyOrdering = false } } })
          end,
        },
      },
    },
  },

  {
    "cwrau/yaml-schema-detect.nvim",
    config = true,
    ft = { "yaml" },
  },
}
EOF

RUN nvim --headless "+Lazy! sync" +qa
