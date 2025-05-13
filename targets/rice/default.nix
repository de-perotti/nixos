{ nixpkgs, home-manager, nixos-hardware, ... }:
  nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      # Root configuration
      ({ pkgs, ... }: {
        system.stateVersion = "24.11";
        nixpkgs.config.allowUnfree = true;
        environment.systemPackages = with pkgs; [];
      })
      # Hardware
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
      # Shared & modules
      ({ ... }: {
        console.useXkbConfig = true;
        services.xserver.xkb.layout = "br";
        services.xserver.xkb.variant = "thinkpad";
        services.printing.enable = true;
        # programs.light.enable = true;
        # programs.light.brightnessKeys.enable = true;
        hardware.bluetooth.enable = true;
        imports = [
          ../../modules/i18n
          ../../modules/networking
          ../../modules/window/sway.nix
          ../../modules/sound/pipewire.nix
          ../../modules/fonts
          ../../modules/docker/rootless.nix
          ../../modules/zsh/common.nix
        ];
      })
      # Home manager
      home-manager.nixosModules.home-manager
      ({ ... }: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      })
      # User with home manager
      ({ pkgs, ... }: {
        users.users.perotti = {
          name = "perotti";
          home = "/home/perotti";
          isNormalUser = true;
          extraGroups = [ "networkmanager" "wheel" ];
          shell = pkgs.zsh;
        };
        home-manager.users.perotti = import ./home.nix;
        services.displayManager.autoLogin.enable = true;
        services.displayManager.autoLogin.user = "perotti";
      })
    ];
  }
