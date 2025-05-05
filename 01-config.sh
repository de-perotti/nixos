set -ex
nixos-generate-config --root /mnt
cp -f configuration.nix /mnt/etc/nixos
