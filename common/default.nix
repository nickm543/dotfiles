{ config, pkgs, lib, ... }:

{
  home.stateVersion = "24.05";

  imports = [
    ./i3
    ./zsh
    ./zellij
    ./alacritty
  ];

  home.packages = [

  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
