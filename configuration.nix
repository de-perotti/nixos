{ config, pkgs, ... }:
{
  imports = [./hardware-configuration.nix];
  boot.initrd.checkJournalingFS = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;
  users.users.perotti.isNormalUser = true;
  users.users.perotti.extraGroups = [ "wheel" ];
  system.stateVersion = "24.11";
}
