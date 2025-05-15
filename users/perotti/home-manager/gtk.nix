{ pkgs, ... }: {
  # home.pointerCursor.enable = true;
  # home.pointerCursor.gtk.enable = true;
  home.pointerCursor.name = "Vanilla-DMZ";
  home.pointerCursor.package = pkgs.vanilla-dmz;
  # gtk.enable = true;
  # gtk.cursorTheme = {
  #   package = pkgs.vanilla-dmz;
  #   name = "Vanilla-DMZ";
  # };
}
