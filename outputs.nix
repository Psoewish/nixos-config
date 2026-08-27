{
  inputs,
  lib,
  ...
}: let
  imports = lib.concatLists (lib.mapAttrsToList (_: tree: tree.imports) {
    devShells = inputs.import-tree ./devShells;
    options = inputs.import-tree ./options;
    hosts = inputs.import-tree ./hosts;
    modules = inputs.import-tree ./modules;
    users = inputs.import-tree ./users;
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
