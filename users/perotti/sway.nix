{ pkgs, lib, ... }: {
  programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;
  programs.xwayland.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.displayManager.gdm.autoSuspend = false;
  services.greetd.enable = true;
  programs.regreet.enable = true;
  programs.regreet.package = pkgs.greetd.wlgreet;
  security.polkit.enable = true;
}
