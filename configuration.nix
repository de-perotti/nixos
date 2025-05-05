{ config, lib, pkgs, ... }:
# TODO: migrate to home manager
{
  # Allow unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "google-chrome"
      "jetbrains-toolbox"
    ];

  disablebModules = [];
  imports = [
    # Silent boot
    ./nixos/silent-boot/boot.nix

    # Hardware
    ./hardware-configuration.nix # Generated

    # Wayland
    # TODO

    # Users
    ./nixos/users/perotti.nix
  ];
  system.stateVersion = "24.11";
}
