{ pkgs, ... }:
# let
  # home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz;
# in
{
  imports = [
    ./hardware-configuration.nix
    # (import "${home-manager}/nixos")
  ];

  #> Boot
  boot.initrd.checkJournalingFS = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;

  #> Timezone
  # time.timeZone = "America/Sao_Paulo";

  #> Programs
  programs.hyprland.enable = true;

  #> Packages
  # nixpkgs.config.allowUnfreePredicate = pkg:
  #   builtins.elem (lib.getName pkg) [
  #     "google-chome"
  #     "jetbrains-toolbox"
  #   ];

  #> User: perotti
  # users.users.perotti.isNormalUser = true;
  # users.users.perotti.extraGroups = [ "wheel" ];
  # home-manager.users.perotti = { pkgs, ... }: {
  #   home.stateVersion = "24.11";
  #   home.packages = [
  #     pkgs.zsh-powerlevel10k
  #     # pkgs.terminator
  #     # pkgs.jetbrains-toolbox
  #     # pkgs.google-chome
  #   ];
  #   programs.git = {
  #     enable = true;
  #     userName  = "Luigi Perotti";
  #     userEmail = "perottilds@gmail.com";
  #   };
  #   programs.zsh = {
  #     enable = true;
  #     ohMyZsh.enable = true;
  #     ohMyZsh.plugins = [
  #       "git"
  #     ];
  #     promptInit = ''
  #       source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme;
  #     '';
  #   };
  # };

  #> Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
