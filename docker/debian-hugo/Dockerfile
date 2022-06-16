FROM ab3k/debian-dev:bullseye

ARG DEBIAN_FRONTEND=noninteractive 

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Key from https://deb.nodesource.com/gpgkey/nodesource.gpg.key
# Needs to be transformed for apt keyrings with:
#   cat nodesource.gpg.key  | gpg --dearmor > nodesource.gpg
COPY nodesource.gpg.key nodesource.gpg /root/
COPY nodesource.gpg /usr/share/keyrings/nodesource.gpg
COPY nodesource.list /etc/apt/sources.list.d/nodesource.list
COPY nodesource.pref /etc/apt/preferences.d/nodesource

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      hugo \
      nodejs \
      asciidoctor \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN groupadd hugo \
      && useradd --no-log-init --shell /usr/bin/fish --home /home/hugo --create-home -g hugo hugo

USER hugo

WORKDIR /home/hugo

CMD ["fish"]
