{ ... }:
{
  # Nix
  system.stateVersion = "24.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "America/Sao_Paulo";
  environment.sessionVariables = rec {
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XCURSOR_SIZE = "24";
  };
  services.printing.enable = true;
  services.openssh.enable = true;
  environment.systemPackages = [
    pkgs.neovim
    pkgs.wget
  ];
  imports = [
    # Boot
    ./modules/boot/boot-virtualbox.nix

    # Hardware
    ./hardware-configuration.nix

    # Programs
    ./modules/programs/zsh.nix
    ./modules/programs/wayland.nix

    # Users
    ./modules/users/perotti.nix
  ];
}
