{ ... }:
# TODO: migrate to home manager
{
  # # Allow unfree packages
  # nixpkgs.config.allowUnfreePredicate = pkg:
  #   builtins.elem (lib.getName pkg) [
  #     "google-chrome"
  #     "jetbrains-toolbox"
  #   ];

  # disabledModules = [];
  imports = [
    # Silent boot
    ./modules/silent-boot/boot.nix

    # Hardware
    ./hardware-configuration.nix # Generated

    # Wayland
    # TODO

    # Users
    ./modules/users/perotti.nix
  ];
  system.stateVersion = "24.11";
}
