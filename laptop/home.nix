{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the paths it should manage.
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

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    htop 
    neofetch
    brave
    taskwarrior
  ];

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
  };

  xsession.pointerCursor = {
    package = pkgs.paper-icon-theme;
    # package = pkgs.vanilla-dmz;
    # name = "Vanilla-DMZ";
    name = "Paper";
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
    };
    shellAliases = {
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      nixhome = "home-manager edit";
      nixsys = "sudoedit /etc/nixos/configuration.nix";
    };
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      font_size   20.0
      font_family Iosevka
      italic_font Iosevka Italic
      bold_font Iosevka Bold
      bold_italic_font Iosevka Bold Italic

      background_opacity 0.9

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

  programs.rofi = {
    enable = true;
    theme = "Arc-Dark";
    padding = 25;
    font = "Iosevka 14";
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
    ];
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      let g:airline_theme = 'solarized'
      colorscheme solarized
      set shiftwidth=4
      set noshowmode
    '';
  };
}
