set -ex
nixos-generate-config --root /mnt
mv -f configuration.nix /mnt/etc/nixos/configuration.nix
mv boot.nix /mnt/etc/nixos/boot.nix
