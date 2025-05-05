{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.zsh-powerlevel10k
  ];
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.plugins = [
    "git"
  ];
  programs.zsh.promptInit = ''
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme;
  '';
  users.users.perotti.isNormalUser = true;
  users.users.perotti.extraGroups = [ "wheel" ];
  users.users.perotti.shell = pkgs.zsh;
}
