{
  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./nix);

  inputs = {
    # TODO: CONFIGURE FOLLOWS
    # Core features
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    devshell.url = "github:numtide/devshell";
    deploy-rs.url = "github:serokell/deploy-rs";
    import-tree.url = "github:denful/import-tree";
    hjem.url = "github:feel-co/hjem";

    mangowm.url = "github:mangowm/mango";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    helium.url = "github:oxcl/nix-flake-helium-browser";
  };
}
