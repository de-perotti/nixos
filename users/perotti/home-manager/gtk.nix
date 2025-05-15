{ pkgs, ... }: {
  gtk.enable = true;
  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 128;
    gtk.enable = true;
    x11.enable = true;
    # sway.enable = true;
  };
}
