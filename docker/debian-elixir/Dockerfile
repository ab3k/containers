FROM ab3k/debian-devel:bullseye

ARG DEBIAN_FRONTEND=noninteractive 
ARG KERL_CONFIGURE_OPTIONS="--without-javac --without-wx --without-odbc"
ARG KERL_BUILD_DOCS=no
ARG KERL_INSTALL_HTMLDOCS=no
ARG KERL_INSTALL_MANPAGES=no

ARG ASDF_VERSION=v0.13.1
ARG ERLANG_VERSION=25.3.2.8
ARG ELIXIR_VERSION=ref:v1.16.0
ARG GLEAM_VERSION=0.33.0
ARG PHOENIX_VERSION=1.7.10

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

USER root

# Key from https://deb.nodesource.com/gpgkey/nodesource.gpg.key
COPY nodesource-archive-keyring.gpg /etc/apt/keyrings/
COPY nodesource.list /etc/apt/sources.list.d/nodesource.list
COPY nodesource.pref /etc/apt/preferences.d/nodesource

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      autoconf \
      automake \
      build-essential \
      inotify-tools \
      libncurses-dev \
      libncurses5-dev \
      libssh-dev \
      locales \
      m4 \
      nodejs \
      unzip \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

USER devel
WORKDIR /home/devel

RUN git clone https://github.com/asdf-vm/asdf.git /home/devel/.asdf -c advice.detachedHead=false --depth 1 --branch $ASDF_VERSION

SHELL ["bash", "-c"]
ARG BASH_ENV=/home/devel/.asdf/asdf.sh

RUN asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
RUN asdf install erlang $ERLANG_VERSION

ARG ASDF_ERLANG_VERSION=$ERLANG_VERSION

RUN asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
RUN asdf install elixir $ELIXIR_VERSION \
      && cd "$(asdf where elixir $ELIXIR_VERSION)" \
      && make clean

RUN asdf plugin add gleam https://github.com/asdf-community/asdf-gleam.git
RUN asdf install gleam $GLEAM_VERSION

RUN asdf list

COPY tool-versions /home/devel/.tool-versions

RUN mix local.hex --force \
      && mix local.rebar --force

RUN mix archive.install --force hex phx_new $PHOENIX_VERSION

COPY asdf.fish iex.fish /home/devel/.config/fish/conf.d/

CMD ["fish"]
