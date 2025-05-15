{ pkgs, lib, ... }: {
  programs.sway.enable = true;
  programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  programs.regreet.enable = true;
  programs.regreet.font.package = pkgs.jetbrains-mono;
  programs.regreet.font.name = "JetBrains";
  programs.regreet.font.size = 16;
  programs.regreet.settings = {
    appearance.greeting_msg = "FYMUG?";
    widget.clock.timezone = "America/Sao_Paulo";
  };
  programs.regreet.extraCss = ''
    picture {
      background-image: url("${./home-manager/config/wallpaper.jpg}");
      background-size: cover;
      background-position: center;
      filter: blur(-0.125rem);
    }
  '';
  services.greetd.enable = true;
  security.polkit.enable = true;
}
