set -ex
mkdir -p /mnt/etc/nixos
cp -fr configuration.nix hardware-configuration.nix modules /mnt/etc/nixos
nixos-install
nixos-enter --root /mnt -c 'passwd perotti'
