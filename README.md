# Node.js & Python

## Summary

*Base on Debian slim-buster. Includes Node.js, Yarn, Python.*

| Metadata | Value |
|----------|-------|
| *Contributors* | The Polyms Team |
| *Published image* | docker.pkg.github.com/polyms/devcontainers/python-node-buster |
| *Published image architecture(s)* | x86-64 |
| *Container host OS support* | Linux, macOS, Windows |
| *Container OS* | Debian |
| *Languages, platforms* | Node.js v14.16.0, Yarn v1.22.10, Python v3.9.2 |

## Using this definition with an existing folder

Beyond Node.js, and `git`, this image / `Dockerfile` includes `zsh`, [Oh My Zsh!](https://ohmyz.sh/), a non-root `node` user with `sudo` access, and a set of common dependencies for development.

Note that, while `eslint`and `typescript` are installed globally for convenance, [as of ESLint 6](https://eslint.org/docs/user-guide/migrating-to-6.0.0#-plugins-and-shareable-configs-are-no-longer-affected-by-eslints-location), you will need to install the following packages locally to lint TypeScript code: `@typescript-eslint/eslint-plugin`, `@typescript-eslint/parser`, `eslint`, `typescript`.

### Adding the definition to your project

Just follow these steps:

1. If this is your first time using a development container, please follow the [getting started steps](https://aka.ms/vscode-remote/containers/getting-started) to set up your machine.
2. Start VS Code and open your project folder.
3. Press <kbd>F1</kbd> select and **Remote-Containers: Add Development Container Configuration Files...** from the command palette.****
4. Select the From 'docker-compose.yml'.
5. View example in `./devcontainer` and make two files like you need.
6. Finally, press <kbd>F1</kbd> and run **Remote-Containers: Reopen Folder in Container** to start using the definition.

## License

Licensed under the MIT License. See [LICENSE](https://github.com/Microsoft/vscode-dev-containers/blob/master/LICENSE).
