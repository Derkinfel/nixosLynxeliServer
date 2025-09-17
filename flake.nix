{
	description = "A simple NixOS flake";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nur = {
			url = "github:nix-community/NUR";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		sops-nix = {
			url = "github:Mic92/sops-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
    deploy-rs.url = "github:serokell/deploy-rs";
	};
	outputs = { self, nixpkgs, home-manager, sops-nix, user_scripts, deploy-rs, ... }@inputs: {
		nixosConfigurations.nixosServer = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./hosts
				./services
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.derkinfel = { pkgs, ... }: {
						imports = [ ./users/lynxeli ];
						_module.args.user_scripts = user_scripts;
					};
				}
				sops-nix.nixosModules.sops
			];
		};
	};
}
