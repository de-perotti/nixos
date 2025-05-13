{ ... }: {
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  # services.xserver.displayManager.gdm.enable = false;
  # services.xserver.displayManager.gdm.wayland = true;
  programs.sway.enable = true;
  programs.sway.package = null;
  programs.xwayland.enable = true;
  security.polkit.enable = true;
}
