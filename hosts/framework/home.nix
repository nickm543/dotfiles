{ config, pkgs, lib, ... }:

{
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  imports = [
    ../../common
  ];

  services.vicinae = {
    enable = true;
    autoStart = true;
  };
}
