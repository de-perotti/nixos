{ pkgs, ... }: {
  programs.sway.enable = true;
  programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  programs.regreet.enable = true;
  services.greetd.enable = true;
  security.polkit.enable = true;
}
