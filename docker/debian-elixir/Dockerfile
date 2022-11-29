FROM ab3k/debian-devel:bullseye

ARG DEBIAN_FRONTEND=noninteractive 
ARG KERL_CONFIGURE_OPTIONS="--without-javac --without-wx --without-odbc"
ARG KERL_BUILD_DOCS=no
ARG KERL_INSTALL_HTMLDOCS=no
ARG KERL_INSTALL_MANPAGES=no

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

USER root

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      build-essential \
      autoconf \
      automake \
      inotify-tools \
      libncurses-dev \
      libssh-dev \
      locales \
      nodejs \
      m4 \
      unzip \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

USER devel
WORKDIR /home/devel

RUN git clone https://github.com/asdf-vm/asdf.git /home/devel/.asdf -c advice.detachedHead=false --depth 1 --branch v0.10.2

SHELL ["bash", "-c"]
ARG BASH_ENV=/home/devel/.asdf/asdf.sh

RUN asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
RUN asdf install erlang 24.3.4.5

ARG ASDF_ERLANG_VERSION=24.3.4.5
RUN asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
RUN asdf install elixir ref:v1.14.0 \
      && cd "$(asdf where elixir ref:v1.14.0)" \
      && make clean

RUN asdf plugin add gleam https://github.com/asdf-community/asdf-gleam.git
RUN asdf install gleam 0.22.1

RUN asdf list

COPY tool-versions /home/devel/.tool-versions

RUN mix local.hex --force \
      && mix local.rebar --force

RUN mix archive.install --force hex phx_new

COPY asdf.fish iex.fish /home/devel/.config/fish/conf.d/

CMD ["fish"]
