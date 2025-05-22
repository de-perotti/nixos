set -ex
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
sudo nixos-rebuild switch --flake .#x86_64-linux --upgrade
git checkout -- hardware-configuration.nix
