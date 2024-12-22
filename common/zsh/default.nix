{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "fishy";
      plugins = [
	      "git"
      ];
    };
    shellAliases = {
      v = "lvim";
      vi = "lvim";
      vim = "lvim";
      ls = "eza -l";
      cat = "bat";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gb = "git branch";
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
