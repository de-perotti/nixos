{ pkgs, ... }:
{
  users.users.perotti.isNormalUser = true;
  users.users.perotti.extraGroups = [ "wheel" ];
  users.users.perotti.shell = pkgs.zsh;
}
