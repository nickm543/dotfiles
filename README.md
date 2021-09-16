# My nixOS dotfiles

## Pre-reqs
- Using nixOS
- Have home-manager installed

## Install
- `git clone https://github.com/nickm543/dotfiles`
- `sudo mv dotfiles/configuration.nix dotfiles/hardware-configuration.nix /etc/nixos/`
- `mv dotfiles/home.nix $HOME/.config/nixpkgs/`
### Rebuild configuration
- `sudo nixos-rebuild switch`
- `home-manager switch`
