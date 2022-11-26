FROM debian:bullseye

ARG DEBIAN_FRONTEND=noninteractive 

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      apt-utils \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

# slirp4netns for podman
RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      ca-certificates \
      curl \
      direnv \
      file \
      fish \
      git \
      iproute2 \
      iputils-ping \
      jq \
      less \
      neovim \
      netcat-openbsd \
      procps \
      psmisc \
      python3 \
      ripgrep \
      slirp4netns \
      socat \
      tmux \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

COPY evilmartians-lefthook-archive-keyring.gpg /usr/share/keyrings/evilmartians-lefthook-archive-keyring.gpg
COPY evilmartians-lefthook.list /etc/apt/sources.list.d/evilmartians-lefthook.list

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      lefthook \
      postgresql-client \
      sqlite3 \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN groupadd devel \
      && useradd --no-log-init --shell /usr/bin/fish --home /home/devel --create-home -g devel devel

USER devel
WORKDIR /home/devel

CMD ["fish"]
