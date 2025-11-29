{ config, pkgs, ... }:

{
  hardware = {
    graphics = {
      enable = true;
    };
    # For passing GPU to containers
    # nvidia-container-toolkit.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # Don't use open source kernel module
    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = with pkgs; [
    # For passing GPU to containers 
    libnvidia-container
    nvidia-container-toolkit
  ];
}
