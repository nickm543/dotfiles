{ config, pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = rec {
      modifier = "Mod4";
      bars = [ ];

      window.border = 0;

      gaps = {
        inner = 15;
	      outer = 5;
      };

      keybindings = lib.mkOptionDefault {
	      "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
	      "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
	      "${modifier}+c" = "exec ${pkgs.brave}/bin/brave";
	      "${modifier}+Shift+e" = "exec i3-msg exit";
      };

      startup = [
	      {
	        command = "${pkgs.feh}/bin/feh --bg-scale ~/.config/wallpaper/wall.png";
	        always = true;
	        notification = false;
	      }
	      {
	        command = "bash ~/.config/scripts/fix-displays.sh";
	        always = true;
	        notification = false;
	      }
      ];
    };
  };
}
