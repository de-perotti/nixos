{ pkgs, ... }:
{
  imports = [./hardware-configuration.nix];

  #> Boot
  boot.initrd.checkJournalingFS = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;

  #> Timezone
  time.timeZone = "America/Sao_Paulo";

  #> Programs
  programs.hyprland.enable = true;

  #> Packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "google-chome"
      "jetbrains-toolbox"
    ];
  environment.systemPackages = [
    pkgs.zsh-powerlevel10k
    pkgs.waybar
    pkgs.dunst
    pkgs.libnotify
    pkgs.swww
    pkgs.terminator
    pkgs.rofi-wayland
    pkgs.jetbrains-toolbox
    pkgs.google-chome
    # (pkgs.waybar.overrideAttrs (oldAttrs: {
    #     mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    #   })
    # )
  ];

  #> XDG
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  ];

  #> Zsh
  # programs.zsh.enable = true;
  # programs.zsh.ohMyZsh.enable = true;
  # programs.zsh.ohMyZsh.plugins = [
  #   "git"
  # ];
  # programs.zsh.promptInit = ''
  #   source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme;
  # '';

  #> Users
  users.users.perotti.isNormalUser = true;
  users.users.perotti.extraGroups = [ "wheel" ];
  users.users.perotti.shell = pkgs.zsh;

  #> Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
