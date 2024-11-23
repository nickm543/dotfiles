{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "essembeh";
      plugins = [
	"git"
      ];
    };
    shellAliases = {
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      ls = "eza -l";
      cat = "bat";
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
