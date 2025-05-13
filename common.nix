{ pkgs, inputs, ... }:
{
  imports = [
    ./modules/i18n
    ./modules/networking
    ./modules/window/sway.nix
    ./modules/sound/pipewire.nix
    ./modules/fonts
    ./modules/docker/rootless.nix
    ./modules/zsh/common.nix
  ];
  services.printing.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [];
  system.stateVersion = "24.11";
}