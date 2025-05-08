inputs @ { nixpkgs, home-manager, nixos-hardware, pkgs, ... }:
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
      ../../modules/keyboard/pt-br.nix
      home-manager.nixosModules.home-manager
      {
        users.users.perotti = {
          name = "perotti";
          home = "/home/perotti";
          isNormalUser = true;
          extraGroups = ["audio" "video" "networkmanager" "wheel" ];
          shell = pkgs.zsh;
        };
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.perotti = ./home.nix;
      }
    ];
  }
