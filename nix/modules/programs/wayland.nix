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
    settings = rec {
      default_session = {
        command = "${pkgs.greetd.wlgreet}/bin/wlgreet --command sway";
      };
    };
  };
}
