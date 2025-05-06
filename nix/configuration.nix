{ pkgs, ... }:
{
  imports = [./hardware-configuration.nix];
  #> Boot
  boot.initrd.checkJournalingFS = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;
  #> Timezone
  time.timeZone = "America/Sao_Paulo";
  #> Zsh
  # environment.systemPackages = [
  #   pkgs.zsh-powerlevel10k
  # ];
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
  # users.users.perotti.shell = pkgs.zsh;
  #> Programs
  programs.hyprland.enable = true;
  #> Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
