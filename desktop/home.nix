{ config, pkgs, lib, ... }:

let

  # increase ui scale for brave using a package wrapper
  brave-4k = pkgs.symlinkJoin {
    name = "brave";
    paths = [ pkgs.brave ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/brave \
        --add-flags "--force-device-scale-factor=1.50"
    '';
  };

  xcursorTheme = "Paper";
  xcursorPackage = pkgs.paper-icon-theme;
  xcursorSize = 32;

in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  home.packages = with pkgs; [
    # utils
    htop pfetch taskwarrior rofi feh conky fzf ripgrep dunst

    # applications
    kitty brave-4k slack discord zsh vlc flameshot gimp wpsoffice blender ranger

    # python pkgs
    python39Packages.scapy
    python39Packages.ics
    # needed for gdb gef features
    python38Packages.keystone-engine
    python38Packages.unicorn
    python38Packages.capstone
    python38Packages.ropper


    # sec tools
    wireshark

    # games
    minecraft
  ];

  # use xresources to set the cursor theme:
  xresources.properties = {
    "Xcursor.theme" = xcursorTheme;
    "Xcursor.size" = xcursorSize;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.numix-solarized-gtk-theme;
      name = "NumixSolarizedDarkCyan";
    };

    iconTheme = {
      package = pkgs.paper-icon-theme;
      name = "Paper";
    };
    gtk2.extraConfig = ''
      gtk-cursor-theme-name="${xcursorTheme}"
      gtk-cursor-theme-size="${toString xcursorSize}"
    '';
    gtk3.extraConfig = {
      "gtk-cursor-theme-name" = xcursorTheme;
      "gtk-cursor-theme-size" = xcursorSize;
    };
  };

  # Services:

  services.picom = {
    backend = "glx";
    enable = true;

    shadow = true;
    shadowExclude = [
      "class_g = 'Polybar'"
    ];

    fade = true;
    fadeDelta = 2;

    vSync = true;

    # extraOptions = ''
    #   use-damage = false
    # '';
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "JetBrains Mono 12";
        monitor = 0;
        transparency = 0;
        geometry = "300x5-30+20";
        follow = "keyboard";
        indicate_hidden = "yes";
        shrink = "no";
        notification_height = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        frame_width = 3;
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        show_age_threshold = 60;
        word_wrap = "yes";
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        icon_position = "left";
        max_icon_size = 32;
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        startup_notification = false;
        force_xinerama = false;
      };
      shortcuts = {
        close = "ctrl+space";
        close_all = "ctrl+shift+space";
        history = "ctrl+grave";
        context = "ctrl+shift+period";
      };
      urgency_low = {
        background = "#002b36";
        foreground = "#ffffff";
        frame_color = "#2aa198";
        timeout = 10;
      };
      urgency_normal = {
        background = "#002b36";
        foreground = "#ffffff";
        frame_color = "#2aa198";
        timeout = 10;
      };
      urgency_critical = {
        background = "#002b36";
        foreground = "#ffffff";
        frame_color = "#ff0000";
        timeout = 0;
      };
    };
  };

  # Programs:

  programs.kitty = {
    enable = true;
    extraConfig = ''
      font_size   24.0
      background_opacity 0.8

      background #001e26
      foreground #708183
      cursor #708183
      selection_background #002731
      color0 #002731
      color8 #001e26
      color1 #d01b24
      color9 #bd3612
      color2 #728905
      color10 #465a61
      color3 #a57705
      color11 #52676f
      color4 #2075c7
      color12 #708183
      color5 #c61b6e
      color13 #5856b9
      color6 #259185
      color14 #81908f
      color7 #e9e2cb
      color15 #fcf4dc
      selection_foreground #001e26
    ''; 
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;

    oh-my-zsh = {
      enable = true;
      # plugins = [

      # ]; 
      theme = "juanghurtado";
    };

    localVariables = {
      EDITOR = "nvim";
      BROWSER = "brave";
      XDG_CONFIG_HOME = "/home/nick/.config";
    };

    shellAliases = {
      # vim aliases
      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      # git aliases 
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gC = "git checkout";
      gp = "git push";
      gP = "git pull";
      gb = "git branch";
      gm = "git merge";
      gf = "git fetch";

      # nixos aliases
      nh = "home-manager edit";
      ns = "sudoedit /etc/nixos/configuration.nix";

      # misc aliases
      sxhkd = "nvim ~/.config/sxhkd/sxhkdrc";
      bspwm = "nvim ~/.config/bspwm/bspwmrc";

    };
  };

  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-airline
      vim-airline-themes
      auto-pairs
      vim-surround 
      vim-colors-solarized 
      fzf-vim
      nerdtree
    ];
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      let mapleader = " "
      let g:airline_theme = 'solarized'
      colorscheme solarized
      set shiftwidth=4
      set noshowmode
      set number
      set relativenumber

      nnoremap <leader>n :NERDTreeFocus<CR>
      nnoremap <C-n> :NERDTree<CR>
      nnoremap <C-t> :NERDTreeToggle<CR>
      nnoremap <C-f> :NERDTreeFind<CR>
    '';
  };

  programs.tmux = {
    enable = true;
    shell = "/home/nick/.nix-profile/bin/zsh";
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      tmux-colors-solarized
    ];
    extraConfig = ''
      set -g @colors-solarized 'dark'
    '';
  };
}
