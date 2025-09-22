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
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      # flake = false;
    };
	};
	outputs = { self, nixpkgs, home-manager, sops-nix, deploy-rs, ... }@inputs: {
		nixosConfigurations.nixosServer = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./hosts
				./services
        # home-manager.nixosModules.home-manager {
				# 	home-manager.useGlobalPkgs = true;
				# 	home-manager.useUserPackages = true;
				# 	home-manager.users.lynxeli = { pkgs, ... }: {
				# 		imports = [ ./users/lynxeli ];
				# 	};
				# }
				sops-nix.nixosModules.sops
			];
		};
    deploy.nodes.nixosServer = {
      hostname = "212.192.246.121";
      # hostname = "103.231.73.243";
      sshUser = "root";
      activationTimeout = 600;
      confirmTimeout    = 180;
      magicRollback     = true;
      profiles.system = {
        user = "root";
        path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.nixosServer;
      };
    };
  };
}
