{ lib, ... }:
modulesDir:
let
  inherit (lib)
    fix
    recursiveUpdate
    mapAttrsToList
    foldl'
    hasSuffix
    hasPrefix
    removeSuffix
    ;
  inherit (builtins) readDir;

traverse = fix (
  traverse: path:
  foldl' recursiveUpdate { __namespace = true; } (
    mapAttrsToList (
      name: type:
      if type == "directory" then
        { ${name} = traverse (path + "/${name}"); }
      else if type == "regular" && hasSuffix ".nix" name && !hasPrefix "_" name then
        { ${removeSuffix ".nix" name} = import (path + "/${name}"); }
      else
        { }
    ) (readDir path)
  )
);
in
traverse modulesDir
