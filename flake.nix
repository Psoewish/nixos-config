# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    flake-file.url = "github:denful/flake-file";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    helium.url = "github:oxcl/nix-flake-helium-browser";
    home-manager.url = "github:nix-community/home-manager";
    import-tree.url = "github:vic/import-tree";
    nix-auto-follow = {
      url = "github:fzakaria/nix-auto-follow";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord.url = "github:4evy/nixcord";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pear-desktop.url = "github:h-banii/pear-desktop-nix";
    systems.url = "github:nix-systems/default";
    vaultix.url = "github:milieuim/vaultix";
  };
}
