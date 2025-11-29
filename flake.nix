{
  description = "Nick's NixOS config";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    vicinae.url = "github:vicinaehq/vicinae";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    vicinae,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      stealthbomber = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/stealthbomber/configuration.nix
        ];
      };
      framework = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/framework/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "nick@stealthbomber" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/stealthbomber/home.nix
          vicinae.homeManagerModules.default
        ];
      };
      "nick@framework" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/framework/home.nix
        ];
      };
    };
  };
}
