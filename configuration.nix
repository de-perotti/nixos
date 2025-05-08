# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:
let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "rice";
  networking.networkmanager.enable = true;
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
  ];
  networking.firewall.enable = true;
  services.openssh.enable = true;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = false;
  programs.sway.enable = true;

  console.keyMap = "br-abnt2";
  services.xserver.xkb = {
    layout = "br";
    variant = "abnt2";
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [];
  programs.zsh.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    jetbrains-mono
  ];

  users.users.perotti = {
    isNormalUser = true;
    extraGroups = ["audio" "video" "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.perotti = { pkgs, ... }: {
    home.stateVersion = "24.11";
    programs.home-manager.enable = true;
  
    home.username = "perotti";
    home.homeDirectory = "/home/perotti";

    fonts.fontconfig.enable = true;
    fonts.fontconfig.defaultFonts = {
      emoji = [
        "Noto Color Emoji"
      ];
      monospace = [
        "JetBrains Mono"
        "JetBrains Mono Nerd Font"
      ];
      sansSerif = [
        "Noto Sans"
        "Noto Sans CJK SC"
      ];
      serif = [
        "Noto Serif"
      ];
    };
  
    home.packages = with pkgs; [
      google-chrome
      jetbrains-toolbox
      neovim
      docker
      docker-compose
      curl
      wget
      terminator
      vscode
      nerdfonts
    ];

    programs.htop.enable = true;
    programs.fastfetch.enable = true;

    programs.foot.enable = true;
    programs.foot.server.enable = true;
    programs.foot.settings = {
      main = {
        font = "JetBrains Mono:size=13";
        letter-spacing=0;
        dpi-aware = true;
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
  };
  
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "24.11";
}