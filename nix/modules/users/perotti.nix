{ pkgs, ... }:
{
  users.users.perotti.isNormalUser = true;
  users.users.perotti.extraGroups = [ "wheel" "video" ];
  users.users.perotti.shell = pkgs.zsh;
}
