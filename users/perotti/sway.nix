{ pkgs, ... }: {
  programs.sway.enable = true;
  programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  programs.regreet.enable = true;
  services.greetd.enable = true;
  services.greetd.settings = {
    default_session.command = "${pkgs.greetd.regreet}/bin/regreet --cmd sway";
  };
  security.polkit.enable = true;
}
