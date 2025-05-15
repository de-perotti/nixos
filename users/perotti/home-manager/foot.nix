{ ... }: {
  programs.foot.enable = true;
  programs.foot.server.enable = true;
  programs.foot.settings = {
    main = {
      font = "JetBrains Mono:size=13:weight=extrabold:line-height=1.2";
      letter-spacing=0;
      dpi-aware = false;
    };
    cursor = {
      style = "block";
      blink = true;
    };
    mouse = {
      hide-when-typing = true;
    };
  };
}
