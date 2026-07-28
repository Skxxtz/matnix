{
  description = "matrix.skxxtz.de - Conduit + bridges on Raspberry Pi 3B+";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.12";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      agenix,
      ...
    }:
    {
      nixosConfigurations.matrix = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./hardware-configuration.nix
          ./modules
          agenix.nixosModules.default
        ];
      };
    };
}
