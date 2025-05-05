set -ex
mkdir -p /mnt/etc/nixos
ln -s configuration.nix /mnt/etc/nixos/configuration.nix
ln -s hardware-configuration.nix /mnt/etc/nixos/hardware-configuration.nix
ln -s nixos /mnt/etc/nixos/nixos
nixos-install
nixos-enter --root /mnt -c 'passwd perotti'
