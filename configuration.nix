{ ... }:
{
  imports = [./hardware-configuration.nix];
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.device = nodev;
  boot.loader.grub.efiSupport = true;
  system.stateVersion = "24.11";
}
