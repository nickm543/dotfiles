{ config, pkgs, ... }:

{
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  home.sessionPath = [
    "~/.config/scripts"
  ];
  
  imports = [
    ../../common
  ];

  services.vicinae = {
    enable = true;
    autoStart = true;

    settings = {
      theme = { name = "solarized-dark"; };
    };
  };
}
