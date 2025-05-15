set -ex
sudo nix-env --delete-generations old
sudo nix-collect-garbage --delete-old
