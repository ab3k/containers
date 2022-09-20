FROM ab3k/debian-dev:bullseye

ARG DEBIAN_FRONTEND=noninteractive 

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Key from https://deb.nodesource.com/gpgkey/nodesource.gpg.key
# Needs to be transformed for apt keyrings with:
#   cat nodesource.gpg.key | gpg --dearmor > nodesource.gpg
COPY nodesource.gpg.key nodesource.gpg /root/
COPY nodesource.gpg /usr/share/keyrings/nodesource.gpg
COPY nodesource.list /etc/apt/sources.list.d/nodesource.list
COPY nodesource.pref /etc/apt/preferences.d/nodesource

# Key from https://dl.yarnpkg.com/debian/pubkey.gpg as yarnpkg.gpg.key
COPY yarnpkg.gpg.key yarnpkg.gpg /root/
COPY yarnpkg.gpg /usr/share/keyrings/yarnpkg.gpg
COPY yarnpkg.list /etc/apt/sources.list.d/yarnpkg.list
COPY yarnpkg.pref /etc/apt/preferences.d/yarnpkg

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      nodejs \
      yarn \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN groupadd devel \
      && useradd --no-log-init --shell /usr/bin/fish --home /home/devel --create-home -g devel devel

USER devel
WORKDIR /home/devel

CMD ["fish"]
