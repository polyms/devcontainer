FROM mcr.microsoft.com/dotnet/sdk:5.0

ARG USERNAME=vscode

RUN apt update \
    && apt install -y --no-install-recommends ca-certificates curl zsh git openssh-server sudo \
    && rm -rf /var/lib/apt/lists/* \
    && apt autoclean \
    && groupadd --gid 1000 ${USERNAME} \
    && useradd --uid 1000 --gid ${USERNAME} --shell /bin/bash --create-home ${USERNAME} \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN mkdir -p /home/$USERNAME/.vscode-server/extensions \
        /home/$USERNAME/.vscode-server-insiders/extensions \
    && chown -R $USERNAME \
        /home/$USERNAME/.vscode-server \
        /home/$USERNAME/.vscode-server-insiders

USER ${USERNAME}

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

COPY --chown=${USERNAME}:${USERNAME} .zshrc /home/${USERNAME}/

CMD [ "sleep", "infinity" ]
