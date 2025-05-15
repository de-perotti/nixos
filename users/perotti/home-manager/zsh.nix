{ pkgs, lib, ... }: {
  programs.zsh = { 
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    history = {
      path = ".config/zsh/.zsh_history";
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
        src = ./config/zsh/plugins;
        file = "p10k-config/.p10k.zsh";
      }
      {
        name = "fastfetch";
        src = ./config/zsh/plugins;
        file = "fastfetch.sh";
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
}
