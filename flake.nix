{
  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (import ./outputs.nix);

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    import-tree.url = "github:denful/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";

    mangowm.url = "github:mangowm/mango";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    helium.url = "github:oxcl/nix-flake-helium-browser";
    nix-alien.url = "github:thiagokokada/nix-alien";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
}
