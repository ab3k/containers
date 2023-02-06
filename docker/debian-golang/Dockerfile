FROM ab3k/debian-devel:bullseye

ARG DEBIAN_FRONTEND=noninteractive

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

USER root

COPY backports.list /etc/apt/sources.list.d/backports.list
COPY backports.pref /etc/apt/preferences.d/backports

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      g++ \
      gcc \
      libc6-dev \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq -t bullseye-backports \
      golang \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

USER devel
WORKDIR /home/devel

ARG GOPATH=/home/devel/go

COPY path.fish /home/devel/.config/fish/conf.d/path-golang.fish
RUN GOPROXY=https://proxy.golang.org \
      go install golang.org/x/tools/gopls@latest \
      && go install github.com/go-delve/delve/cmd/dlv@latest \
      && go install honnef.co/go/tools/cmd/staticcheck@latest \
      && go clean -modcache

CMD ["fish"]
