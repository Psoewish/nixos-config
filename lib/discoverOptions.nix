{ lib }:
optionsDir:
let
  inherit (lib) fix hasSuffix concatMap;
  inherit (builtins) readDir attrNames;
in
fix (
  collectOptions:
  concatMap (
    name:
    if (readDir optionsDir) == "directory" then
      collectOptions (readDir (optionsDir + "/${name}"))
    else if (name: hasSuffix ".nix" name) name then
      [ (readDir (optionsDir + "/${name}")) ]
    else
      [ ]
  ) (attrNames (readDir optionsDir))
)
