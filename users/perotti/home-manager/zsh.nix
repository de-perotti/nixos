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
    initContent = let
      zshConfig = lib.mkOrder 1500 "${pkgs.fastfetch}/bin/fastfetch";
    in
      lib.mkMerge [ zshConfigEarlyInit zshConfig ];
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./config/p10k-config;
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
}
