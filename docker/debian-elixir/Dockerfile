FROM debian:bullseye

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV KERL_CONFIGURE_OPTIONS "--without-javac --without-wx --without-odbc"
ENV KERL_BUILD_DOCS no
ENV KERL_INSTALL_HTMLDOCS no
ENV KERL_INSTALL_MANPAGES no

# slirp4netns for podman
# unzip for unpacking elixir releases
RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      build-essential \
      curl \
      git \
      inotify-tools \
      psmisc \
      procps \
      unzip \
      && apt-get clean

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      ca-certificates \
      less \
      autoconf \
      m4 \
      automake \
      libncurses5-dev \
      libssh-dev \
      libncurses-dev \
      locales \
      && apt-get clean

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0

RUN bash -c "source /root/.asdf/asdf.sh && asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git && asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git"

RUN bash -c "source /root/.asdf/asdf.sh && asdf install erlang 24.0.6 && asdf install elixir 1.13.1-otp-24"

COPY bashrc /root/.bashrc

COPY tool-versions /root/.tool-versions

CMD ["bash"]
