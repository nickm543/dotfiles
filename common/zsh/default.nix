{ config, pkgs, ... }:

let
    zsh-fzf-history-search = pkgs.fetchFromGitHub {
        owner = "joshskidmore";
        repo = "zsh-fzf-history-search";
        rev = "master";
        hash = "sha256-tQqIlkgIWPEdomofPlmWNEz/oNFA1qasILk4R5RWobY=";
    };
in
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
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      ls = "eza -l";
      cat = "bat";
      dots = "cd ~/.dotfiles/hosts/stealthbomber";
      wofi = "wofi --conf ~/.config/wofi/config/config --style ~/.config/wofi/src/macchiato/style.css";
      scr = "cd ~/.config/scripts";
      beamng = "cd /home/nick/.local/share/Steam/steamapps/compatdata/284160/pfx/drive_c/users/steamuser/AppData/Local/BeamNG.drive/0.35";
      nrs = "sudo nixos-rebuild switch --flake .";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gS = "git switch";
      gp = "git push";
      gP = "git pull";
      gb = "git branch";
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Add '(cat ~/.cache/wal/sequences &)' to source pywal colors
    initContent = ''
      source ${zsh-fzf-history-search}/zsh-fzf-history-search.plugin.zsh
      export PATH=$PATH:/home/nick/.config/emacs/bin
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
    '';
  };
}
