{ pkgs, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = false;
  };

  environment.systemPackages = [
    pkgs.greetd.wlgreet
  ];

  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session.command = "sway";
    };
  };
}
