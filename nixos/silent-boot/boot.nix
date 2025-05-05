{ config, pkgs, ... }:
{
    boot.consoleLogLevel = 0;
    boot.initrd.checkJournalingFS = true;
    boot.initrd.systemd.enable = true;
    boot.initrd.verbose = false;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.enable = true;
    boot.loader.timeout = 0;
    boot.kernelParams = [
        "quiet"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
    ];
    systemd.watchdog.rebootTime = "0";
    i18n.defaultLocale = "en_US.UTF-8";
    console.font = "ter-v32n";
    console.keyMap = "us";
    console.packages = [pkgs.terminus_font];
}
