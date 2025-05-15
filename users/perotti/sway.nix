{ pkgs, lib, ... }: {
  programs.sway.enable = true;
  programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.greetd.enable = true;
  services.greetd.settings = {
    default_session.command = "${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.wlgreet}/bin/wlgreet";
  };
  security.polkit.enable = true;
}
