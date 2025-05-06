{ ... }:
{
  boot.initrd.checkJournalingFS = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;
}
