FROM ab3k/debian-dev:bullseye

ARG DEBIAN_FRONTEND=noninteractive 

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      python3 \
      python3-pip \
      python3-venv \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN groupadd python \
      && useradd --no-log-init --shell /usr/bin/fish --home /home/python --create-home -g python python

USER python

WORKDIR /home/python

RUN pip3 install --user --no-warn-script-location \
      black \
      isort \
      pip-tools \
      poetry \
      pytest

RUN mkdir -p /home/python/.config/fish/conf.d
COPY path.fish /home/python/.config/fish/conf.d/

CMD ["fish"]
