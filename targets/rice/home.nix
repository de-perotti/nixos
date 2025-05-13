{ pkgs, config, lib, ... }: {
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home.username = "perotti";
  home.homeDirectory = "/home/perotti";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts = {
    emoji = [ "Noto Color Emoji" ];
    monospace = [ "JetBrains Mono" ];
    sansSerif = [ "Noto Sans" ];
    serif = [ "Noto Serif" ];
  };

  home.packages = with pkgs; [
    google-chrome
    jetbrains-toolbox
    neovim
    curl
    wget
    nerdfonts
    vscode
  ];

  programs.htop.enable = true;
  programs.fastfetch.enable = true;

  programs.foot.enable = true;
  programs.foot.server.enable = true;
  programs.foot.settings = {
    main = {
      font = "JetBrains Mono:size=13:weight=extrabold:line-height=1.2";
      letter-spacing=0;
      dpi-aware = false;
    };
    cursor = {
      style = "block";
      blink = true;
    };
    mouse = {
      hide-when-typing = true;
    };
  };

  programs.zsh = { 
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    history = {
      path = "$HOME/.config/zsh/.zsh_history";
      size = 10000;
      save = 10000;
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ../../config/p10k-config;
        file = ".p10k.zsh";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "colorize"
        "docker"
        "docker-compose"
        "git"
        "emoji"
        "history"
        "node"
        "npm"
      ];
    };
  };

  programs.git.enable = true;
  programs.git.userName = "de-perotti";
  programs.git.userEmail = "perottilds@gmail.com";

  programs.yazi.enable = true;
  programs.yazi.enableZshIntegration = true;

  wayland.windowManager.sway = let
      wallpaper = ../../config/wallpaper.jpg;
      modifier = "Mod4";
    in {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    extraConfig = ''
        bindsym ${modifier}+0 mode "$mode_system"
        set $mode_system (l)ock, (e)xit, switch_(u)ser, (s)uspend, (h)ibernate, (r)eboot, (Shift+s)hutdown
        mode "$mode_system" {
        # reference https://github.com/amanusk/i3/blob/master/i3exit
        # TODO lock
        # bindsym l exec --no-startup-id i3exit lock, mode "default"
        # bindsym s exec --no-startup-id i3exit suspend, mode "default"
        # bindsym h exec --no-startup-id i3exit hibernate, mode "default"
          bindsym e exec --no-startup-id swaymsg exit, mode "default"
          bindsym r exec --no-startup-id systemctl reboot, mode "default"
          bindsym Shift+s exec --no-startup-id systemctl poweroff, mode "default"

        # exit system mode: "Enter" or "Escape"
          bindsym Return mode "default"
          bindsym Escape mode "default"
        }
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
      keybindings = {
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
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+a" = "focus parent";
        "${modifier}+b" = "splith";
        "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_path | ${pkgs.dmenu}/bin/dmenu | ${pkgs.findutils}/bin/xargs swaymsg exec --";
        "${modifier}+e" = "layout toggle split";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        "${modifier}+m" = "bar mode toggle";
        "${modifier}+minus" = "scratchpad show";
        "${modifier}+s" = "layout stacking";
        "${modifier}+space" = "focus mode_toggle";
        "${modifier}+v" = "splitv";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+Return" = "exec ${pkgs.foot}/bin/foot";
        "${modifier}+F2" = "exec ${pkgs.google-chrome}/bin/google-chrome-stable";
      };
      output.eDP-1.bg = "${wallpaper} fill";
      output.eDP-1.mode = "1920x1080";
      bars = [
        {
          statusCommand = "${pkgs.i3status}/bin/i3status";
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
        {command = "jetbrains-toolbox --minimize";}
      ];
    };
  };
}
