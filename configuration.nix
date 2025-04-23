{ config, pkgs, lib, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	environment = {
		systemPackages = with pkgs; [
			lightdm-gtk-greeter
			papirus-icon-theme
			catppuccin-gtk
		];
		etc."lightdm/lightdm-gtk-greeter.conf".source = lib.mkForce ./lightdm-gtk-greeter.conf;
		etc."wallpapers/lightdm.png".source = ./lightdm.png;
	};

	fonts = {
		enableDefaultPackages = true;
		fontconfig.enable = true;
		packages = with pkgs; [
			(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
		];
	};

	services = {
		displayManager.defaultSession = "none+i3";
		xserver.displayManager.lightdm = {
			enable = true;
			greeters.gtk.enable = true;
		};
	};
}
