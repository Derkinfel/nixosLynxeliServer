{ config, pkgs, user_scripts, ... }:

{
	home = {
		username = "derkinfel";
		homeDirectory = "/home/derkinfel";
		stateVersion = "25.05";
		file = {
			"bin".source = "${user_scripts}/";
		};
	};

	programs = {
		git = {
			enable = true;
			userName = "derkinfel";
			userEmail = "derkinfel@gmail.com";
		};
	};
}
