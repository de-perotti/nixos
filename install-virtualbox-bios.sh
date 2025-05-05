set -ex
parted -s /dev/sda -- mklabel msdos
parted -s /dev/sda -- mkpart primary 1MB -8GB
parted -s /dev/sda -- set 1 boot on
parted -s /dev/sda -- mkpart primary linux-swap -8GB 100%
mkfs.ext4 -FL nixos /dev/sda1
mkswap -L swap /dev/sda2
mount /dev/disk/by-label/nixos /mnt
swapon /dev/sda2
nixos-generate-config --root /mnt
mv -f configuration.nix /mnt/etc/nixos/configuration.nix
nixos-install
