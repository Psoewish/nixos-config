{
  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (import ./outputs.nix);

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    import-tree.url = "github:denful/import-tree";
    deploy-rs.url = "github:serokell/deploy-rs";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    direnv-instant = {
      url = "github:mic92/direnv-instant";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    helium.url = "github:oxcl/nix-flake-helium-browser";
  };
}
