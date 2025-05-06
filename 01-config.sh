set -ex
nixos-generate-config --root /mnt --dir $(pwd)
mkdir -p /mnt/etc/nixos
cp -f configuration.nix hardware-configuration.nix /mnt/etc/nixos
