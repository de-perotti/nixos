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
    # Hardware
    ./hardware-configuration.nix # Generated

    # Wayland
    # TODO
  ];
  boot.initrd.checkJournalingFS = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;
  users.users.perotti.isNormalUser = true;
  users.users.perotti.extraGroups = [
      "wheel" # Enable sudo
  ];
  system.stateVersion = "24.11";
}
