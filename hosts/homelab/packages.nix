{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		git
		gh
		wget
		sing-box
		btop
		gnupg
		pinentry
		age
		sops
    speedtest-cli
	];
}
