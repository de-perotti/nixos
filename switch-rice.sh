set -ex
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
sudo nixos-rebuild switch --flake .#rice
git checkout -- hardware-configuration.nix
