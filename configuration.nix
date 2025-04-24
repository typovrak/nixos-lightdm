{ config, pkgs, lib, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.lightdm = ''
		cp typovrak.png /var/lib/AccountsService/icons/typovrak
		chmod 644 /var/lib/AccountsService/icons/typovrak

		cp typovrak /var/lib/AccountsService/users/typovrak
		chmod 644 /var/lib/AccountsService/users/typovrak
	'';

	environment = {
		systemPackages = with pkgs; [
			lightdm-gtk-greeter
			papirus-icon-theme
			(catppuccin-gtk.override {
				accents = [ "green" ];
				variant = "mocha";
			})
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
