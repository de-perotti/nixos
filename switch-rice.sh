set -ex
sudo nixos-generate-config
cat /etc/nixos/hardware-configuration.nix > hardware-configuration.nix
sudo nixos-rebuild switch --flake .#rice
git checkout -- hardware-configuration.nix
