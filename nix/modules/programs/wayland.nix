{ pkgs, ... }:
{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = [
      pkgs.swaylock
      pkgs.swayidle
      pkgs.wl-clipboard
      pkgs.wf-recorder
      pkgs.mako # notification daemon
      pkgs.grim
      pkgs.slurp
      pkgs.alacritty # Alacritty is the default terminal in the config
      pkgs.dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
    ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';
  };
  programs.waybar.enable = true;
  qt.platformTheme = "qt5ct";
}
