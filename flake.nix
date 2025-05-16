{
  description = "My NixOS, macOS and home-manager configurations";
  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
    warn-dirty = false;
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    systems.url = "github:nix-systems/x86_64-linux";
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.systems.follows = "systems";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs = inputs@{ flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: {
      nixosConfigurations.rice = import ./nixos/rice inputs;
      devShells.default = let
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
        with input.pkgs; mkShell {
          buildInputs = [
                openssl
                pkg-config
                eza
                fd
                rust-bin.beta.latest.default
              ];

              shellHook = ''
                alias ls=eza
                alias find=fd
              '';
        };
    });
}
