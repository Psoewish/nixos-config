{
  inputs,
  lib,
  ...
}: let
  imports = lib.concatLists (lib.mapAttrsToList (_: tree: tree.imports) {
    fractal = inputs.import-tree ./fractal;
    hosts = inputs.import-tree ./hosts;
    modules = inputs.import-tree ./modules;
    devShells = inputs.import-tree ./devShells;
    wiring = inputs.import-tree ./wiring;
  });
in {
  systems = import inputs.systems;
  imports =
    imports
    ++ [./global.nix ./routing.nix]
    ++ [inputs.flake-parts.flakeModules.modules];
}
