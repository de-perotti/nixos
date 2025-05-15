{ pkgs, home-manager, lib, ... }: {
  system.stateVersion = "24.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "jetbrains-toolbox"
    "google-chrome"
    "vscode"
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  environment.systemPackages = with pkgs; [];
  imports = [
    ./networking.nix
    ./i18n.nix
    ./fonts.nix
    ./keyboard.nix
    ./zsh.nix
    ./sway.nix
    ./pipewire.nix
    ./bluetooth.nix
    ./docker.nix
  ];
  services.printing.enable = true;

  users.users.perotti = {
    name = "perotti";
    home = "/home/perotti";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  home-manager.users.perotti = ./home-manager/home.nix;
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "perotti";
}
