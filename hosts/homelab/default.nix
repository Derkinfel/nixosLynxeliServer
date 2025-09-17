{ config, lib, pacakges, ... }:
{
	imports = [
		./hardware-configuration.nix
		./packages.nix
		./configuration.nix
    ./sysctl.nix
    ./security.nix
	];
}
