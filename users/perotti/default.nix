{ pkgs, lib, ... }: {
  system.stateVersion = "24.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.warn-dirty = false;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "webstorm"
    "goland"
    "rust-rover"
    "google-chrome"
    "vscode"
    "stremio-shell"
    "stremio-server"
    "cursor"
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
}
