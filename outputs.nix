{
  inputs,
  lib,
  ...
}: let
  imports = lib.concatLists (lib.mapAttrsToList (_: tree: tree.imports) {
    hosts = inputs.import-tree ./hosts;
    users = inputs.import-tree ./users;
    fractal = inputs.import-tree ./fractal;
    modules = inputs.import-tree ./modules;
    devShells = inputs.import-tree ./devShells;
  });
in {
  systems = ["x86_64-linux"];

  imports =
    imports
    ++ [./global.nix ./routing.nix]
    ++ (with inputs; [
      flake-parts.flakeModules.modules
    ]);
}
