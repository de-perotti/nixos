{ pkgs, lib, ... }: {
  programs.sway.enable = true;
  programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  programs.regreet.enable = true;
  programs.regreet.font.package = pkgs.jetbrains-mono;
  programs.regreet.settings = lib.mkDefault {
    background.path = ./home-manager/config/wallpaper.jpg;
    GTK.font_name = "JetBrainsMono Nerd Font Mono 16";
    appearance.greeting_msg = "FYMUG?";
    widget.clock.timezone = "America/Sao_Paulo";
  };
  services.greetd.enable = true;
  security.polkit.enable = true;
}
