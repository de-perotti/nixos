{ ... }: {
  console.useXkbConfig = true;
  services.xserver.xkb.layout = "br";
  services.xserver.xkb.variant = "thinkpad";
}
