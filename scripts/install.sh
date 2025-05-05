set -ex
mkdir -p /mnt/etc/nixos
cp -f configuration.nix hardware-configuration.nix /mnt/etc/nixos
nixos-install
nixos-enter --root /mnt -c 'passwd perotti'
