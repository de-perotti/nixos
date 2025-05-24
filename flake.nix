{
  description = "My NixOS, macOS and home-manager configurations";
  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
    warn-dirty = false;
  };
  inputs = {
    systems.url = "github:nix-systems/default";
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.systems.follows = "systems";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs = inputs @ { flake-utils, nixpkgs, ... }:
    with flake-utils; lib.eachSystem [ lib.system.x86_64-linux ] (system: let
        pkgs = import nixpkgs { inherit system; };
      in {
        nixosConfigurations = import ./nixos/rice inputs;
        devShells.default = import ./shells/nodejs_22.nix { inherit pkgs; };
      }
    );
}
