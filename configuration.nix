{ config, pkgs, ... }:
{
  imports = [
    ./modules/boot/boot.nix
    ./hardware-configuration.nix
    ./modules/wayland/sway.nix
    ./modules/users/perotti.nix
  ];
  system.stateVersion = "24.11";
}
