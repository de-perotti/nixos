{...}: {
  # >! This file is a placeholder !<
  # Hardware Configuration is obtained at runtime
  # on the target host
  # eg: sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
  fileSystems."/" = {
    device = "placeholder";
    fsType = "ext4";
  };
}
