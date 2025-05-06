{ pkgs, ... }:
{
  imports = [
    # Boot
    ./modules/boot/boot-virtualbox.nix

    # Hardware
    ./hardware-configuration.nix

    # Programs
    ./modules/programs/zsh.nix
    ./modules/programs/hyprland.nix

    # Users
    ./modules/users/perotti.nix
  ];

  time.timeZone = "America/Sao_Paulo";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
