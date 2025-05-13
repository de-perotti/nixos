{ ... }: {
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  programs.sway.enable = true;
  programs.xwayland.enable = true;
  security.polkit.enable = true;
}
