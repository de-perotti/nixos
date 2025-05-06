set -ex;
nixos-install;
nixos-enter --root /mnt -c 'passwd perotti';
