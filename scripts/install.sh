set -ex
ln -s configuration.nix /mnt/etc/nixos/configuration.nix
ln -s nixos /mnt/etc/nixos/nixos
nixos-install
nixos-enter --root /mnt -c 'passwd perotti'
