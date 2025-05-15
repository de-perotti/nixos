{ pkgs, ... }: {
  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.phinger-cursors;
  gtk.cursorTheme.name = "phinger-cursors-dark";
  gtk.cursorTheme.size = 128;
  # home.pointerCursor = {
  #   name = "phinger-cursors-dark";
  #   package = pkgs.phinger-cursors;
  #   size = 128;
  #   gtk.enable = true;
  #   x11.enable = true;
  #   # sway.enable = true;
  # };
}
