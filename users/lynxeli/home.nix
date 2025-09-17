{ config, pkgs, user_scripts, ... }:

{
	home = {
		username = "lynxeli";
		homeDirectory = "/home/lynxeli";
		stateVersion = "25.05";
		file = {
			"bin".source = "${user_scripts}/";
		};
	};

	programs = {
		git = {
			enable = true;
			userName = "lynxeli";
			userEmail = "lynxeli@gmail.com";
		};
	};
}
