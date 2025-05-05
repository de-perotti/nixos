set -ex
nixos-generate-config --root /mnt
cp -f configuration.nix /mnt/etc/nixos/configuration.nix
cp -f boot.nix /mnt/etc/nixos/boot.nix
