FROM ab3k/debian-devel:bullseye

ARG DEBIAN_FRONTEND=noninteractive 

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1

USER root

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      python3 \
      python3-pip \
      python3-venv \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

USER devel
WORKDIR /home/devel

RUN pip3 install --user --no-warn-script-location \
      black \
      isort \
      pip-tools \
      poetry \
      pytest

COPY path.fish /home/devel/.config/fish/conf.d/path-python.fish

CMD ["fish"]
