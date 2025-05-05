{ config, lib, pkgs, ... }:
{
  imports = [./hardware-configuration.nix];
  boot = {
    initrd.checkJournalingFS = true;
    loader.grub.enable = true;
    loader.grub.device = "/dev/sda";
  };
  system.stateVersion = "24.11";
}
