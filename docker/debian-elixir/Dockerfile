FROM ab3k/debian-dev:bullseye

ARG DEBIAN_FRONTEND=noninteractive 
ARG KERL_CONFIGURE_OPTIONS="--without-javac --without-wx --without-odbc"
ARG KERL_BUILD_DOCS=no
ARG KERL_INSTALL_HTMLDOCS=no
ARG KERL_INSTALL_MANPAGES=no

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      build-essential \
      autoconf \
      automake \
      inotify-tools \
      libncurses-dev \
      libssh-dev \
      locales \
      m4 \
      unzip \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN groupadd elixir \
      && useradd --no-log-init --shell /usr/bin/fish --home /home/elixir --create-home -g elixir elixir

USER elixir
WORKDIR /home/elixir

RUN git clone https://github.com/asdf-vm/asdf.git /home/elixir/.asdf -c advice.detachedHead=false --depth 1 --branch v0.10.2

SHELL ["bash", "-c"]
ARG BASH_ENV=/home/elixir/.asdf/asdf.sh

RUN asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
RUN asdf install erlang 24.1.7

ARG ASDF_ERLANG_VERSION=24.1.7
RUN asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
RUN asdf install elixir ref:v1.13.4 \
      && cd "$(asdf where elixir ref:v1.13.4)" \
      && make clean

RUN asdf list

COPY tool-versions /home/elixir/.tool-versions

RUN mix local.hex --force \
      && mix local.rebar --force \
      && mix archive.install hex phx_new

RUN mkdir -p /home/elixir/.config/fish/conf.d
COPY asdf.fish iex.fish /home/elixir/.config/fish/conf.d/

CMD ["fish"]
