{
  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (import ./outputs.nix);

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    import-tree.url = "github:denful/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:nix-community/stylix";
    basix.url = "github:notashelf/basix";

    mangowm.url = "github:mangowm/mango";
    mangowm.inputs.nixpkgs.follows = "nixpkgs";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    helium.url = "github:oxcl/nix-flake-helium-browser";
    nix-alien.url = "github:thiagokokada/nix-alien";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    nix-index-database.url = "github:nix-community/nix-index-database";
  };
}
