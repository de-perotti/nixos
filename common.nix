{ pkgs, inputs, ... }:
{
  imports = [
    ./modules/i18n
    ./modules/networking
    ./modules/window/sway.nix
    ./modules/sound/pipewire.nix
    ./modules/fonts
    ./modules/docker/rootless.nix
  ];

  services.printing.enable = true;

  programs.light.enable = true;
  programs.light.brightnessKeys.enable = true;

  hardware.bluetooth.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  

  system.stateVersion = "24.11";
}