{
  description = "My NixOS, macOS and home-manager configurations";
  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs = inputs@{ nixpkgs, home-manager, ... }:  {
    nixosConfigurations.rice = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.perotti = ./home.nix;
        }
        ./hardware-configuration.nix
      ];
    };
  };
}
