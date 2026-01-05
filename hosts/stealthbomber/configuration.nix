# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/nvidia.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "stealthbomber"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.extraHosts = 
    ''
      192.168.1.1  udm.nick.lan
      192.168.1.20 pve.nick.lan
      192.168.1.60 ha.nick.lan
      192.168.1.158 syncthing.nick.lan
    '';

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Virtualisation
  virtualisation.libvirtd.enable = true;
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };
  programs.dconf.enable = true;


  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable i3
  services.xserver.windowManager.i3.enable = true;
  
  # Enable Hyprland
  programs.hyprland.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure PAM to unlock KWallet
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nick = {
    isNormalUser = true;
    description = "nick";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" ];
    packages = with pkgs; [
      alacritty
      ghostty
      bat
      brave
      librewolf
      qutebrowser
      eza
      fzf
      gimp
      kdePackages.kate
      kdePackages.krunner
      neovim
      slack
      discord
      vscode
      flameshot
      pfetch
      audacity
      omnissa-horizon-client
      vlc
      prismlauncher
      feh
      pywal
      picom
      (polybar.override {
        pulseSupport = true;
      })
      waybar
      betterlockscreen
      rofi
      wofi
      lxappearance
      mpv
      mpd           # Music player daemon
      mpc           # Command line interface to mpd
      ncmpcpp       # Music player (mpd frontend)
      yt-dlp
      fspy
      sxiv
      bitwarden-cli
      musescore
      i3lock-fancy-rapid
      via
      hyprpaper
      hyprlock
      hypridle
      wl-clipboard
      grim
      slurp
      pfetch
      pywalfox-native
      nwg-look
      libnotify
      dunst
      lf          # Terminal file manager
      psst        # Spotify client
      vesktop     # Discord client
      obsidian
      zathura
      ((emacsPackagesFor emacs).emacsWithPackages (
        epkgs: [ epkgs.vterm ]
      ))
      fd
      ripgrep
      tmux
      yazi
      pyright
      libreoffice
      kubectl
      kubernetes-helm
      go
      pureref
      hyprsunset
      ccemux
        
      # LSP
      lua-language-server
      (python3.withPackages (ps: with ps; [
        python-lsp-server
      ]))
    ];
    shell = pkgs.zsh;
  };

  fonts.packages = [
    pkgs.nerd-fonts.inconsolata
    pkgs.nerd-fonts.iosevka
  ];

  # Tailscale client
  services.tailscale.enable = true;

  # Steam
  programs.steam.enable = true;

  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "fspy-1.0.3"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     nodejs
     wget
     curl
     git
     gcc
     btop
     gnumake
     (blender.override {cudaSupport = true;})
     cudatoolkit
     pciutils
     python3
     p7zip
     unzip
     virt-manager
     dig
     remmina
     killall
     pulsemixer
     ntfs3g
     traceroute
     jdk8
     file
     glibtool
     libtool
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable Syncthing
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };


  # services.polybar.package = pkgs.polybar.override {
  #   pulseSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  programs.nix-ld.enable = true;

}
