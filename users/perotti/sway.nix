{ ... }: {
  programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  programs.sway.enable = true;
  security.polkit.enable = true;
}
