{
  inputs,
  lib,
  ...
}: let
  imports = lib.concatLists (lib.mapAttrsToList (_: tree: tree.imports) {
    devShells = inputs.import-tree ./devShells;
    hosts = inputs.import-tree ./hosts;
    modules = inputs.import-tree ./modules;
    options = inputs.import-tree ./options;
  });
in {
  systems = ["x86_64-linux"];

  imports =
    imports
    ++ [./metadata.nix]
    ++ (with inputs; [
      flake-parts.flakeModules.modules
    ]);
}
