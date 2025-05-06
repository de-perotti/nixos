{ ... }:
{
  imports = [
    # Boot
    ./modules/boot/boot-virtualbox.nix

    # Hardware
    ./hardware-configuration.nix

    # Programs
    ./modules/programs/zsh.nix
    ./modules/programs/sway.nix

    # Users
    ./modules/users/perotti.nix

    # Nix
    ./modules/nix/default.nix

    # System
    ./modules/system/default.nix
  ];  
}
