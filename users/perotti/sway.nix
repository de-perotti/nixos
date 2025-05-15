{ pkgs, ... }: {
  programs.xwayland.enable = true;
  # services.xserver.displayManager.gdm.enable = true; -> auto gnome greeter
  services.greetd.enable = true;
  services.greetd.settings = {
    default_session = "${pkgs.regreet}/bin/regreet --cmd sway";
  };
  programs.regreet.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  programs.sway.enable = true;
  security.polkit.enable = true;
}
