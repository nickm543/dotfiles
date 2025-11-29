{ config, pkgs, ... }:

{
  imports = [
    ./nord.nix
  ];

  programs.alacritty = {
    enable = false;
    settings = {
      font = {
        size = 16;
        normal = {
          family = "Iosevka NF";
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
