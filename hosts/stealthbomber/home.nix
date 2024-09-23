{ config, pkgs, ... }:

{
  home.username = "nick";
  home.homeDirectory = "/home/nick";
  
  imports = [
    ../../common
  ];
}
