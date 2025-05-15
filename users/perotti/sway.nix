{ pkgs, lib, ... }: {
  programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;
  programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.displayManager.gdm.autoSuspend = false;
  services.greetd.enable = true;
  services.greetd.settings = {
    default_session.command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
  };
  security.polkit.enable = true;
}
