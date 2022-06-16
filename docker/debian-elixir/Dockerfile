FROM ab3k/debian-dev:latest

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
      && apt-get clean

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0

RUN bash -c "source /root/.asdf/asdf.sh && asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git && asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git"

RUN bash -c "source /root/.asdf/asdf.sh && asdf install erlang 24.0.6 && asdf install elixir 1.13.1-otp-24"

COPY bashrc /root/.bashrc

COPY tool-versions /root/.tool-versions

CMD ["bash"]
