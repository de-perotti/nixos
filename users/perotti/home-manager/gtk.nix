{ pkgs, ... }: {
  # home.pointerCursor.sway.enable = true;
  home.pointerCursor.gtk.enable = true;
  gtk.enable = true;
  gtk.cursorTheme = {
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
  };
}
