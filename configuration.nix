{ pkgs, ... }:
let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz;
in
{
  imports = [
    ./hardware-configuration.nix
    (import "${home-manager}/nixos")
  ];

  #> Boot
  boot.initrd.checkJournalingFS = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;

  #> Timezone
  # time.timeZone = "America/Sao_Paulo";

  #> Programs
  # programs.hyprland.enable = true;
  # environment.systemPackages = [
  #   pkgs.kitty
  # ];

  #> Packages
  # nixpkgs.config.allowUnfreePredicate = pkg:
  #   builtins.elem (lib.getName pkg) [
  #     "google-chome"
  #     "jetbrains-toolbox"
  #   ];
  environment.systemPackages = [
    pkgs.seatd
  ];
  services.seatd.enable = true;
  #> User: perotti
  users.users.perotti.isNormalUser = true;
  users.users.perotti.extraGroups = [ "wheel" "video" ];
  home-manager.users.perotti = { pkgs, ... }: {
    home.stateVersion = "24.11";
    programs.kitty.enable = true;
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.settings = {
      "$mod" = "SUPER";
      bind =
        [
          "$mod, F, exec, firefox"
          ", Print, exec, grimblast copy area"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
    };
    home.sessionVariables.NIXOS_OZONE_WL = "1";
  };

  #> Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
