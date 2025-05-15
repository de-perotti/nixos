{ pkgs, ... }: {
  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 64;
    gtk.enable = true;
  };
}
