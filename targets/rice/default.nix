inputs @ { nixpkgs, home-manager, nixos-hardware, ... }:
  nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      nixos-hardware.nixosModules.common-pc-laptop-ssd
      nixos-hardware.nixosModules.common-cpu-intel
      nixos-hardware.nixosModules.common-gpu-intel
      ./hardware-configuration.nix
      {
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
        networking.hostName = "rice";
      }
      ../../common.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.perotti = ./home.nix;
      }
    ];
  }
