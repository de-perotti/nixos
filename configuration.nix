{ config, lib, pkgs, ... }:
# TODO: migrate to home manager
{
  imports = [./hardware-configuration.nix];
  boot = import ./boot.nix;

  # #/>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  # # Wayland configuration
  # # TODO: configure waybar instead of sway-bar (may have to customize gtk theme due to compatibility issues)
  # environment.systemPackages = with pkgs; [
  #   grim # screenshot functionality
  #   slurp # screenshot functionality
  #   wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
  #   mako # notification system developed by swaywm maintainer
  # ];
  # # Enable the gnome-keyring secrets vault. 
  # # Will be exposed through DBus to programs willing to store secrets.
  # services.gnome.gnome-keyring.enable = true;
  # # enable Sway window manager
  # programs.sway = {
  #   enable = true;
  #   wrapperFeatures.gtk = true;
  # };

  #/>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  # Allow unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "google-chrome"
      "jetbrains-toolbox"
    ];

  #/>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.perotti = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [ "wheel" ];
    packages = [
      pkgs.google-chrome
      pkgs.jetbrains-toolbox
    ];
  };

  #/>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  system.stateVersion = "24.11";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = [
  #   pkgs.grim
  #   pkgs.slurp
  #   pkgs.wl-clipboard
  #   pkgs.mako
  #   pkgs.htop
  #   pkgs.curl
  #   pkgs.wget
  #   pkgs.zip
  #   pkgs.unzip
  #   pkgs.jq
  #   pkgs.qemu_kvm
  # ];
  # i18n = {
  #   defaultLocale = "en_US";
  #   extraLocaleSetting = {
  #     LC_ADDRESS = "pt_BR";
  #     LC_IDENTIFICATION = "pt_BR";
  #     LC_MEASUREMENT = "pt_BR";
  #     LC_MONETARY = "pt_BR";
  #     LC_NAME = "pt_BR";
  #     LC_NUMERIC = "pt_BR";
  #     LC_PAPER = "pt_BR";
  #     LC_TELEPHONE = "pt_BR";
  #     LC_TIME = "pt_BR";
  #   };
  # };
  # hardware = {
  #   pulseaudio.enable = true;
  # };
  # networking = {
  #   hostname = "brabus";
  #   networkmanager.enable = true;
  # };

  # programs = {
  #   sway = {
  #     enable = true;
  #     wrapperFeatuers.gtk = true;
  #   };
  # };
  # time.timeZone = "America/Sao_Paulo";
  # services = {
  #   gnome = {
  #     gnome-keyring.enable = true;
  #   };
  #   gvfs.enable = true; # Mount, trash, and other functionalities
  #   tumbler.enalbe = true; # Thumbnail support for images
  #   pipewire = {
  #     enable = true;
  #     alsa.enable = true;
  #     alsa.support32Bit = true;
  #     pulse.enable = true;
  #   };
  #   # Enable CUPS to print documents.
  #   printing.enable = true;
  #   # Enable the OpenSSH daemon.
  #   openssh.enable = true;
  # };
  # sound.enable = true;
}
