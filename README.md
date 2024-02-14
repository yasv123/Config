# Some required dependencies for nvim setup
```bash
brew install lazygit
brew install luarocks
brew install tmux
brew install --cask alacritty
brew insall ripgrep
```

## Font setup
https://www.nerdfonts.com/font-downloads
FiraCode Nerd Font
NOT the mono
Unzip and install

:e nvim/init.lua (why is this here???)
# oh-my-zsh

## plugins
Current plugins:
```bash
plugins=(rust git zsh-aliases-exa)
```

### `Exa`
Get `exa` (`ls` replacement) and also the `zsh-aliases-exa` plugin

### `nvm`
add following to `.zshrc` to help speed up shell load times if using `nvm` plugin
```bash
# brew nvm stuffs
export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
alias loadnvm="[ -s \"/usr/local/opt/nvm/nvm.sh\" ] && . \"/usr/local/opt/nvm/nvm.sh\""
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
```

