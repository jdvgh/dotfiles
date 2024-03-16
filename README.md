# Dotfiles and NixOS Setup

Insipired by [gabyx/dotfile](https://github.com/gabyx/dotfiles)

Run to setup flake for config `desktop`:
`sudo nixos-rebuild switch --flake .#desktop -p flake-based --upgrade`


Add powerlevel10k:
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
