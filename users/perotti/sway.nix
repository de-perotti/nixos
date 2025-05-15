{ pkgs, lib, ... }: {
  programs.sway.enable = true;
  programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  programs.regreet.enable = true;
  programs.regreet.font.package = pkgs.jetbrains-mono;
  programs.regreet.font.name = "JetBrainsMono 16";
  programs.regreet.settings = {
    background.path = ./home-manager/config/wallpaper.jpg;
    appearance.greeting_msg = "FYMUG?";
    widget.clock.timezone = "America/Sao_Paulo";
  };
  services.greetd.enable = true;
  security.polkit.enable = true;
}
