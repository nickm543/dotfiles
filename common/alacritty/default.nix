{ config, pkgs, ... }:

{
  imports = [
    ./nord.nix
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 16;
        normal = {
          family = "Inconsolata Nerd Font Mono";
          style = "regular";
        };
      };
      window = {
        opacity = 0.95;
        blur = true;
      };
    };
  };
}
