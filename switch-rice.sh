set -ex
sudo nixos-generate-config
cat /etc/nixos/hardware-configuration.nix > machines/rice/hardware-configuration.nix
sudo nixos-rebuild switch --flake .#rice 
