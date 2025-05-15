{ pkgs, config, ... }: {
  programs.i3status-rust.enable = true;
  programs.i3status-rust.bars = {
    "default" = {
      theme = "nord-dark";
      icons = "awesome6";
      blocks = [
        { block = "sound"; driver = "pulseaudio"; }
        { block = "backlight"; }
        { block = "battery"; }
        { block = "time"; }
      ];
    };
  };

  services.swaync.enable = true;

  wayland.windowManager.sway = let
      wallpaper = ./config/wallpaper.jpg;
      modifier = "Mod4";
    in {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    extraConfig = ''
        bindsym ${modifier}+Shift+0 mode "$mode_system"
        set $mode_system (l)ock, (e)xit, (s)uspend, (h)ibernate, (r)eboot, (Shift+s)hutdown
        mode "$mode_system" {
          bindsym l exec --no-startup-id ${pkgs.swaylock}/bin/swaylock; mode "default"
          bindsym s exec --no-startup-id ${pkgs.swaylock}/bin/swaylock -f && systemctl suspend; mode "default"
          bindsym h exec --no-startup-id ${pkgs.swaylock}/bin/swaylock -f && systemctl hibernate; mode "default"
          # TODO: should I used pkgs reference here?
          bindsym e exec --no-startup-id swaymsg exit; mode "default"
          bindsym r exec --no-startup-id systemctl reboot; mode "default"
          bindsym Shift+s exec --no-startup-id systemctl poweroff; mode "default"

        # exit system mode: "Enter" or "Escape"
          bindsym Return mode "default"
          bindsym Escape mode "default"
        }
      '';
    extraSessionCommands = ''
      export GDK_BACKEND=wayland
    '';
    config = {
      focus.followMouse = false;
      focus.mouseWarping = false;
      gaps.smartBorders = "no_gaps";
      modifier = modifier;
      window.border = 0;
      window.hideEdgeBorders = "both";
      window.titlebar = false;
      input = {
        "type:touchpad" = {
          accel_profile = "flat";
          natural_scroll = "enabled";
          tap = "enabled";
        };
        "type:keyboard" = {
          xkb_layout = "br";
          xkb_variant = "thinkpad";
          repeat_delay = "400";
          repeat_rate = "120";
        };
      };
      keybindings = let
       notify = "exec ${pkgs.libnotify}/bin/notify-send";
      in {
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+Control+1" = "move container to workspace 1";
        "${modifier}+Control+2" = "move container to workspace 2";
        "${modifier}+Control+3" = "move container to workspace 3";
        "${modifier}+Control+4" = "move container to workspace 4";
        "${modifier}+Up" = "focus up";
        "${modifier}+Down" = "focus down";
        "${modifier}+Left" = "focus left";
        "${modifier}+Right" = "focus right";
        "${modifier}+Shift+1" = "move container to workspace 1; workspace 1";
        "${modifier}+Shift+2" = "move container to workspace 2; workspace 2";
        "${modifier}+Shift+3" = "move container to workspace 3; workspace 3";
        "${modifier}+Shift+4" = "move container to workspace 4; workspace 4";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Right" = "move right";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+c" = "reload; ${notify} 'Sway reloaded'";
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+h" = "splith; ${notify} 'Horizontal split'";
        # "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_path | ${pkgs.dmenu}/bin/dmenu | ${pkgs.findutils}/bin/xargs swaymsg exec --";
        # "${modifier}+Ctrl+space" = "exec ${pkgs.wofi}/bin/wofi --show run | ${pkgs.findutils}/bin/xargs swaymsg exec --";
        "${modifier}+space" = "exec ${pkgs.wofi}/bin/wofi -I --show drun | ${pkgs.findutils}/bin/xargs swaymsg exec --";
        "${modifier}+e" = "layout toggle split";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+m" = "bar mode toggle";
        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+minus" = "scratchpad show";
        "${modifier}+s" = "layout stacking";
        "${modifier}+v" = "splitv; ${notify} 'Vertical split'";
        "${modifier}+r" = "mode resize";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+Return" = "exec ${pkgs.foot}/bin/foot";
        "${modifier}+Shift+Return" = "exec ${pkgs.pwvucontrol}/bin/pwvucontrol"; # Audio
        "${modifier}+Ctrl+Return" = "exec ${pkgs.blueman}/bin/blueman-manager"; # Bluetooth
        "${modifier}+Ctrl+Shift+Return" = "exec ${pkgs.networkmanagerapplet}/bin/nm-connection-editor"; # Internet
        "${modifier}+F1" = "exec ${pkgs.jetbrains-toolbox}/bin/jetbrains-toolbox";
        "${modifier}+F2" = "exec ${pkgs.google-chrome}/bin/google-chrome-stable";
        "${modifier}+F3" = "exec ${pkgs.foot}/bin/foot ${pkgs.yazi}/bin/yazi";
        "${modifier}+F4" = "exec ${pkgs.foot}/bin/foot ${pkgs.btop}/bin/btop";
        "${modifier}+Shift+n" = "exec ${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
        "${modifier}+7" = "exec ${pkgs.pulseaudio}/bin/pactl -- set-sink-volume 0 -10%"; # Volume down
        "${modifier}+8" = "exec ${pkgs.pulseaudio}/bin/pactl -- set-sink-volume 0 +10%"; # Volume up
        "${modifier}+9" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%- -q"; # Brightness down
        "${modifier}+0" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +10% -q"; # Brightness up
        "Print" = "exec --no-startup-id ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify save screen";
        "Ctrl+Print" = "exec --no-startup-id ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify save window";
        "Ctrl+Shift+Print" = "exec --no-startup-id ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify save area";
        "${modifier}+Ctrl+space" = "exec --no-startup-id ${pkgs.rofimoji}/bin/rofimoji";
      };
      output."*".bg = "${wallpaper} fill";
      output."*".mode = "1920x1080";
      bars = [
        {
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${config.xdg.configHome}/i3status-rust/config-default.toml";
          command = "${pkgs.sway}/bin/swaybar";
          workspaceButtons = true;
          workspaceNumbers = true;
          trayOutput = "primary";
          mode = "hide";
          fonts = {
            # nix-shell -p pango
            # pango-list | grep -i jetbrains
            names = [ "JetBrainsMono Nerd Font Mono" "monospace" ];
            style = "Ultra-Bold Bold Regular";
            size = 9.0;
          };
          colors = {
            background =  "#000000";
            statusline =  "#ffffff";
            separator =  "#666666";
            focusedWorkspace =  { background = "#4c7899"; border="#285577"; text= "#ffffff"; };
            activeWorkspace =  { background = "#333333"; border="#5f676a"; text= "#ffffff"; };
            inactiveWorkspace =  { background = "#333333"; border="#222222"; text= "#888888"; };
            urgentWorkspace =  { background = "#2f343a"; border="#900000"; text= "#ffffff"; };
            bindingMode =  { background = "#2f343a"; border="#900000"; text= "#ffffff"; };
          };
        }
      ];
      workspaceAutoBackAndForth = true;
      startup = [
        { command = "${pkgs.swaynotificationcenter}/bin/swaync"; always = true; }
        { command = "${pkgs.jetbrains-toolbox}/bin/jetbrains-toolbox --minimize"; }
      ];
    };
  };
}
