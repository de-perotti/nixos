{ nixpkgs, home-manager, nixos-hardware, ... }:
  nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./hardware-configuration.nix
      nixos-hardware.nixosModules.common-cpu-intel
      nixos-hardware.nixosModules.common-gpu-intel
      nixos-hardware.nixosModules.common-pc-laptop
      nixos-hardware.nixosModules.lenovo-ideapad-s145-15api
      {
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
        networking.hostName = "rice";
      }
      ({ ... }: {
        programs.light.enable = true;
        # programs.light.brightnessKeys.enable = true;
        hardware.bluetooth.enable = true;
      })
      ../../common.nix
      ../../modules/keyboard/br-abnt2.nix
      home-manager.nixosModules.home-manager
      ({ ... }: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      })
      ({ pkgs, ... }: {
        users.users.perotti = {
          name = "perotti";
          home = "/home/perotti";
          isNormalUser = true;
          extraGroups = ["networkmanager" "wheel" ];
          shell = pkgs.zsh;
        };
        
        home-manager.users.perotti = import ./home.nix;
      })
    ];
  }
