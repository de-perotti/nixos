{ pkgs, ... }:

let
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-enviroment";
    executable = true;

    text = ''
      dbus-update-activation-enviroment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };

  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure/-gtk";
    executable = true;
    text =
      let
        schema = pkgs.gsettings-desktop-schemas;
        datadir = "${schema}/share/gsetting-schemas/${schema.name}";
      in
      ''
        export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
        gnome_schema=org.gnome.desktop.interface
        gsettings set $gnome_schema gtk-theme 'WhiteSur-dark'
        gsettings set $gnome_schema cursor-theme 'capitaine-cursors-white'
      '';
  };
in
{
  environment.extraInit = ''
    #Turn off gui for ssh auth
    unset -v SSH_ASKPASS
  '';
  programs.light.enable = true;

  environment.systemPackages = [
    pkgs.alacritty
    pkgs.sway
    dbus-sway-environment
    configure-gtk
    pkgs.wayland
    pkgs.xdg-utils
    pkgs.glib
    pkgs.whitesur-icon-theme
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.capitaine-cursors
  ];
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.sway}/bin/sway";
      };
      default_session = initial_session;
    };
  };
}
