FROM ab3k/debian-devel:bookworm

ARG DEBIAN_FRONTEND=noninteractive

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

USER root

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      golang \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

USER devel
WORKDIR /home/devel

COPY path.fish /home/devel/.config/fish/conf.d/path-golang.fish

CMD ["fish"]
