FROM python:3.9.2-slim-buster

ENV NODE_VERSION 14.16.0
ENV YARN_VERSION 1.22.10

RUN ARCH= && dpkgArch="$(dpkg --print-architecture)" \
  && case "${dpkgArch##*-}" in \
    amd64) ARCH='x64';; \
    ppc64el) ARCH='ppc64le';; \
    s390x) ARCH='s390x';; \
    arm64) ARCH='arm64';; \
    armhf) ARCH='armv7l';; \
    i386) ARCH='x86';; \
    *) echo "unsupported architecture"; exit 1 ;; \
  esac \
  && set -ex \
  && apt-get update \
  && apt-get install -y ca-certificates curl zsh git --no-install-recommends \
  && curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -y nodejs \
  && npm install --no-cache -g yarn \
  && rm -rf /var/lib/apt/lists/* \
  && apt autoclean \
  && groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

USER node

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
  && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

COPY .zshrc /home/node/

CMD [ "sleep", "infinity" ]

# [Optional] Uncomment if you want to install more global node packages
# RUN su node -c "npm install -g <your-package-list -here>"
