{ pkgs, lib, ... }: {
  programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;
  programs.xwayland.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.displayManager.gdm.autoSuspend = false;
  services.greetd.enable = true;
  services.greetd.settings = {
    default_session = {
      command = ''
        ${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time \
          --greet-align left \
          --power-shutdown 'systemctl poweroff' \
          --power-reboot 'systemctl reboot' \
          --window-padding 0 \
          --prompt-padding 1 \
          --container-padding 1 \
          --theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=#FF0000' \
          --cmd sway
      '';
    };
  };
  security.polkit.enable = true;
}
