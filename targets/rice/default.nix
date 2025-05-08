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
      ./laptop.nix
      ../../common.nix
      ../../modules/keyboard/br-abnt2.nix
      home-manager.nixosModules.home-manager
      ({ pkgs, ... }: {
        users.users.perotti = {
          name = "perotti";
          home = "/home/perotti";
          isNormalUser = true;
          extraGroups = ["networkmanager" "wheel" ];
          shell = pkgs.zsh;
        };
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.perotti = import ./home.nix;
      })
    ];
  }
