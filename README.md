# nixos-lightdm

nixos-lightdm = fetchGit {
	url = "https://github.com/typovrak/nixos-lightdm.git";
	ref = "main";
};

(import "${nixos-lightdm}/configuration.nix")
