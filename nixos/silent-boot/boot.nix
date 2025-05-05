{ ... }:
{
    boot.initrd.checkJournalingFS = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.enable = true;
}
