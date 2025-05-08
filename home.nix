{ pkgs, lib, ... }: {
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
    docker
    docker-compose
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
        src = ./p10k-config;
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
}
