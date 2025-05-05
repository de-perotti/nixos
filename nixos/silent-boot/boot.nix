{ config, pkgs, ... }:
{
    boot.consoleLogLevel = 0;
    boot.initrd.checkJournalingFS = true;
    boot.initrd.verbose = false;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.enable = true;
    boot.loader.timeout = 0;
    console.font = "ter-v32n";
    console.keyMap = "us";
    console.packages = [pkgs.terminus_font];
}
