{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 20;
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
