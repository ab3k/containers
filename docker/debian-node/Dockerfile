FROM ab3k/debian-devel:bullseye

ARG DEBIAN_FRONTEND=noninteractive 

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

USER root

# Key from https://deb.nodesource.com/gpgkey/nodesource.gpg.key
COPY nodesource-archive-keyring.gpg /etc/apt/keyrings/
COPY nodesource.list /etc/apt/sources.list.d/nodesource.list
COPY nodesource.pref /etc/apt/preferences.d/nodesource

# Key from https://dl.yarnpkg.com/debian/pubkey.gpg as yarnpkg.gpg.key
COPY yarnpkg-archive-keyring.gpg /etc/apt/keyrings/
COPY yarnpkg.list /etc/apt/sources.list.d/yarnpkg.list
COPY yarnpkg.pref /etc/apt/preferences.d/yarnpkg

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      nodejs \
      yarn \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

USER devel
WORKDIR /home/devel

CMD ["fish"]
