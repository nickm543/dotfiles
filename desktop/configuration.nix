# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/nvme1n1"; # or "nodev" for efi only

  # try to make tp-link t2u work
  boot.extraModulePackages = [ config.boot.kernelPackages.rtl8821au ];

  networking.hostName = "stealthbomber"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp39s0.useDHCP = true;
  networking.interfaces.wlo1.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.


  fonts = {
    enableDefaultFonts = true;
    fontDir.enable = true;
    fonts = with pkgs; [
      corefonts
      dejavu_fonts
      noto-fonts
      iosevka
      jetbrains-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = [
	  "DejaVu Serif"
        ];
        sansSerif = [
	  "SF Pro Display"
        ];
        monospace = [
 	  "JetBrains Mono"
        ];
        emoji = [
	  "Noto Color Emoji"
        ];
      };
    };
  };
  

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };


  # For GPU support in Blender
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
  ];

  # Allow unfree packages:

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # utilities
    vim
    wget
    git
    sxhkd
    killall
    libnotify
    usbutils
    unzip
    betterlockscreen
    lxappearance
    redshift
    virt-manager
    teams

    # sec tools
    nmap 
    python39 
    gdb

    # driver for usb wifi adapter (TP-Link Archer T2U)
    linuxPackages.rtl8821au
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  
  services.openssh.enable = true;

  # Fixes a weird dconf error:
  services.dbus.packages = with pkgs; [ gnome3.dconf ];

  services.cron = {
    enable = true;
    systemCronJobs = [

    ];
  };

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  services.xserver = {
    enable = true;

    displayManager = {
      sessionCommands = ''
        ${pkgs.xlibs.xsetroot}/bin/xsetroot -cursor_name ${pkgs.paper-icon-theme}/share/icons/Paper/cursors/left_ptr 32 &disown
        ${pkgs.xlibs.xset}/bin/xset r rate 200 40
      '';

      lightdm = {
	enable = true;
	greeters = {
          gtk = {
	    enable = true;
	    # cursorTheme = {
            #   package = pkgs.paper-icon-theme;
	    #   name = "Paper";
	    #   size = 32;
	    # };
	  };
	};
      };
    };

    windowManager = {
      default = "bspwm";
      bspwm.enable = true;
    };

    videoDrivers = [ "amdgpu" ];
    useGlamor = true;

    layout = "us";
  };

  services.mongodb.enable = true;

  services.picom.enable = true;
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
  system.stateVersion = "21.05"; # Did you read the comment?

}

