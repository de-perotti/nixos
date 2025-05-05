set -ex
parted -s /dev/sda -- mklabel gpt
parted -s /dev/sda -- mkpart root ext4 512MB -8GB
parted -s /dev/sda -- mkpart swap linux-swap -8GB 100%
parted -s /dev/sda -- mkpart ESP fat32 1MB 512MB
parted -s /dev/sda -- set 3 esp on
mkfs.ext4 -FL nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount -o umask=077 /dev/disk/by-label/boot /mnt/boot
swapon /dev/sda2
nixos-generate-config --root /mnt
mv -f configuration.nix /mnt/etc/nixos/configuration.nix
nixos-install
