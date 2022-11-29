FROM ab3k/debian-dev:bullseye

ARG DEBIAN_FRONTEND=noninteractive 

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      texlive \
      # texlive-fonts-recommended
      # texlive-latex-base
      # texlive-latex-recommended
      texlive-luatex \
      texlive-xetex \
      texlive-bibtex-extra \
      texlive-lang-english \
      texlive-lang-german \
      texlive-latex-extra \
      texlive-pictures \
      texlive-plain-generic \
      biber \
      latexmk \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      asciidoctor \
      pandoc \
      python3-pandocfilters \
      python3-pip \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install --no-install-recommends -yq \
      fontconfig \
      fonts-firacode \
      fonts-inconsolata \
      fonts-linuxlibertine \
      fonts-open-sans \
      fonts-roboto \
      fonts-roboto-slab \
      fonts-symbola \
      fonts-texgyre \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN groupadd pandoc \
      && useradd --no-log-init --shell /usr/bin/fish --home /home/pandoc --create-home -g pandoc pandoc

USER pandoc

WORKDIR /home/pandoc

CMD ["fish"]
