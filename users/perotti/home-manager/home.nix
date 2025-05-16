{ pkgs, config, lib, ... }: {
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
    jetbrains.webstorm
    jetbrains.goland
    jetbrains.rust-rover
    neovim
    curl
    wget
    vscode
    libnotify
    pwvucontrol
    networkmanagerapplet
    sway-contrib.grimshot
    btop
    rofimoji
    vlc
    stremio
    code-cursor
  ];

  imports = [
    ./zsh.nix
    ./foot.nix
    ./sway.nix
    ./gtk.nix
    ./obs-studio.nix
    ./git.nix
  ];

  programs.fastfetch.enable = true;

  programs.yazi.enable = true;
  programs.yazi.enableZshIntegration = true;

  programs.wofi.enable = true;
  programs.wofi.settings = {
    location = "center";
  };
}
