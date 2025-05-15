{...}: {
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" ];
  networking.firewall.enable = true;
  services.openssh.enable = true;
}
