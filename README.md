# NixOS dotfiles

## Usage
Clone repo:
```
git clone git@github.com:nickm543/dotfiles.git
```
Build system configuration:
```
cd dotfiles && sudo nixos-rebuild switch --flake .
```
Build home-manager configuration:
```
home-manager switch --flake .
```
