FROM ab3k/debian-dev:bullseye

ARG DEBIAN_FRONTEND=noninteractive 

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      build-essential \
      make \
      python3 \
      python3-pip \
      python3-venv \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN groupadd python \
      && useradd --no-log-init --shell /usr/bin/fish --home /home/python --create-home -g python python

USER python

WORKDIR /home/python

CMD ["fish"]
