{
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} (import ./outputs.nix);

  inputs = {
    # Base stuff
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";
    direnv-instant = {
      url = "github:mic92/direnv-instant";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cachy-kernel.url = "github:xddxdd/nix-cachyos-kernel";

    # Secrets
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Applications
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
