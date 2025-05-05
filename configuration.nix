{ config, lib, pkgs, ... }:
let
  target = "virtualBox";
  _boot = {
    virtualBox = {
      initrd.checkJournalingFS = true;
      loader.grub.enable = true;
      loader.grub.device = "/dev/sda";
    };
  };
in
{
  imports = [./hardware-configuration.nix];
  boot = _boot."${target}";
  system.stateVersion = "24.11";
}
