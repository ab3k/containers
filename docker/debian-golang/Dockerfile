FROM ab3k/debian-devel:bookworm

ARG DEBIAN_FRONTEND=noninteractive

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

USER root

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      g++ \
      gcc \
      golang \
      libc6-dev \
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
