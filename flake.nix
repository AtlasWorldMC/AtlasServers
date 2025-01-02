 {
  description = "AtlasWorld's Server Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, nixpkgs-unstable, ... }@inputs: 
  {
    nixosConfigurations.power = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      
      specialArgs = {
	inherit inputs;

        pkgs = import nixpkgs {
          config.allowUnfree = true;
          inherit system;
        };

        pkgs-unstable = import nixpkgs-unstable {
          config.allowUnfree = true;
          inherit system;
        };
      };

      modules = [
        ./hosts/power/configuration.nix
      ];
    };
  };
}

