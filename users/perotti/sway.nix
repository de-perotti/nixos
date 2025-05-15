{ pkgs, lib, ... }: {
  programs.sway.enable = true;
  programs.xwayland.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  programs.regreet.enable = true;
  programs.regreet.font.package = pkgs.jetbrains-mono;
  programs.regreet.font.name = "JetBrainsMono Nerd Font Mono 16";
  programs.regreet.settings = {
    appearance.greeting_msg = "FYMUG?";
    widget.clock.timezone = "America/Sao_Paulo";
  };
  programs.regreet.extraCss = ''
    window {
      background-image: url("${./home-manager/config/wallpaper.jpg}");
      background-size: cover;
      background-position: center;
    }

    clock_frame, #clock_frame, .clock_frame {
      border: 1px solid red;
    }

    cancel_button, #cancel_button, .cancel_button {
      border: 1px solid red;
    }
  '';
  services.greetd.enable = true;
  security.polkit.enable = true;
}
