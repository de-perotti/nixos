set -ex
mkdir -p /mnt/etc/nixos
cp -f configuration.nix /mnt/etc/nixos
cp -f hardware-configuration.nix /mnt/etc/nixos/hardware-configuration.nix
cp -fr nixos /mnt/etc/nixos
nixos-install
nixos-enter --root /mnt -c 'passwd perotti'
