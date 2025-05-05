set -ex
nixos-generate-config
cp -f configuration.nix /mnt/etc/nixos/configuration.nix
cp -f boot.nix /mnt/etc/nixos/boot.nix
