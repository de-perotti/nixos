{ ... }:
{
  imports = [
    ./modules/boot/boot.nix
    ./hardware-configuration.nix
    ./modules/wayland/sway.nix
    ./modules/users/perotti.nix
    ./modules/nix/default.nix
    ./modules/system/default.nix
  ];  
}
