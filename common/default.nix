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
    EDITOR = "lvim";
  };

  home.pointerCursor = {
    package = pkgs.libsForQt5.breeze-qt5;
    name = "Breeze";
    size = 48;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
