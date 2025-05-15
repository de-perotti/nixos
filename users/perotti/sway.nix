{ pkgs, lib, ... }: {
  programs.sway.enable = true;
  programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.displayManager.gdm.autoSuspend = false;
  # services.greetd.enable = true;
  security.polkit.enable = true;
}
