{ pkgs, config, lib, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

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
        src = ../../p10k-config;
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

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = rec {
      focus.followMouse = false;
      focus.mouseWarping = false;
      gaps.smartBorders = "no_gaps";
      modes.resize = {
        Down = "resize grow height 10 px";
        Escape = "mode default";
        Left = "resize shrink width 10 px";
        Return = "mode default";
        Right = "resize grow width 10 px";
        Up = "resize shrink height 10 px";
      };
      modifier = "Mod4";
      window.border = 0;
      window.hideEdgeBorders = "both";
      window.titlebar = false;
      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in lib.mkOptionDefault {
        "${modifier}+Shift+1" = "move container to workspace 1; workspace 1";
        "${modifier}+Shift+2" = "move container to workspace 2; workspace 2";
        "${modifier}+Shift+3" = "move container to workspace 3; workspace 3";
        "${modifier}+Shift+4" = "move container to workspace 4; workspace 4";
        "${modifier}+Shift+5" = "move container to workspace 5; workspace 5";
        "${modifier}+Shift+6" = "move container to workspace 6; workspace 6";
        "${modifier}+Shift+7" = "move container to workspace 7; workspace 7";
        "${modifier}+Shift+8" = "move container to workspace 8; workspace 8";
        "${modifier}+Shift+9" = "move container to workspace 9; workspace 9";
        "${modifier}+Shift+0" = "move container to workspace 10; workspace 10";
        "${modifier}+Control+1" = "move container to workspace 1";
        "${modifier}+Control+2" = "move container to workspace 2";
        "${modifier}+Control+3" = "move container to workspace 3";
        "${modifier}+Control+4" = "move container to workspace 4";
        "${modifier}+Control+5" = "move container to workspace 5";
        "${modifier}+Control+6" = "move container to workspace 6";
        "${modifier}+Control+7" = "move container to workspace 7";
        "${modifier}+Control+8" = "move container to workspace 8";
        "${modifier}+Control+9" = "move container to workspace 9";
        "${modifier}+Control+0" = "move container to workspace 10";
      };
      output.eDP-1.bg = "${./wallpaper.jpg} fill";
      output.eDP-1.mode = "1920x1080";
      # bars = [];
      workspaceAutoBackAndForth = true;
      startup = [
        {command = "jetbrains-toolbox --minimize";}
      ];
    };
  };
}
