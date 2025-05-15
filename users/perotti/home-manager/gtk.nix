{ pkgs, ... }: {
  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 128;
    gtk.enable = true;
  };
}
