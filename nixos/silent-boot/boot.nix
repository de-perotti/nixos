{ config, pkgs, ... }:
{
    boot.consoleLogLevel = 0;
    boot.initrd.checkJournalingFS = true;
    boot.initrd.verbose = false;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.enable = true;
}
