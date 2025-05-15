{
  description = "My NixOS, macOS and home-manager configurations";
  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    impermanence.url = "github:nix-community/impermanence";
    impermanence.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs: {
    nixosConfigurations.rice = import ./machines/rice inputs;
  };
}
