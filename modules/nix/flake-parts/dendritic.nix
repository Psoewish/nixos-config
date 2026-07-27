{ inputs, ... }: {
  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-file.url = "github:denful/flake-file";
  };

  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.flake-file.flakeModules.nix-auto-follow or { })
  ];
}
