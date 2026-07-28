{
  description = "matrix.skxxtz.de - Conduit + bridges on Raspberry Pi 3B+";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      agenix,
      ...
    }:
    {
      nixosConfigurations.matnix = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./hardware-configuration.nix
          ./modules
          agenix.nixosModules.default
          nixos-hardware.nixosModules.raspberry-pi-3
        ];
      };
    };
}
