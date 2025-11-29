{ config, pkgs, lib, ... }:

{
  home.stateVersion = "24.05";

  imports = [
    ./i3
    ./zsh
    ./zellij
    # ./alacritty
  ];

  home.packages = [

  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "lvim";
    SWAY_CURSOR_THEME = "Nordic-cursors";
  };

  home.pointerCursor = {
    package = pkgs.nordic;
    name = "Nordic-cursors";
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
