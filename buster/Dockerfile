FROM python:3.9.2-slim-buster

ARG USER=vscode

RUN apt update \
    && apt install -y --no-install-recommends ca-certificates curl zsh git openssh-server sudo

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt install -y nodejs \
    && npm install --no-cache -g npm \
    && npm install --no-cache -g yarn \
    && rm -rf /var/lib/apt/lists/* \
    && apt autoclean \
    && groupadd --gid 1000 ${USER} \
    && useradd --uid 1000 --gid ${USER} --shell /bin/bash --create-home ${USER} \
    && echo $USER ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

USER ${USER}

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

COPY --chown=${USER}:${USER} .zshrc /home/${USER}/

CMD [ "sleep", "infinity" ]

# [Optional] Uncomment if you want to install more global node packages
# RUN su node -c "npm install -g <your-package-list -here>"
