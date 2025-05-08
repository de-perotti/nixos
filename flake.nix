{
  description = "My NixOS, macOS and home-manager configurations";
  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs = { nixpkgs, nixos-hardware, home-manager, ... }: {
    nixosConfigurations.rice = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # nixos-hardware.nixosModules.common-pc-laptop-ssd
        # nixos-hardware.nixosModules.common-cpu-intel
        # nixos-hardware.nixosModules.common-gpu-intel
        ./hardware-configuration.nix
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.perotti = import ./home.nix;
        }
      ];
      };
  };
}
