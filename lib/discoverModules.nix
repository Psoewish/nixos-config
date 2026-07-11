{ lib, ... }:
modulesDir:
let
  inherit (lib)
    fix
    recursiveUpdate
    mapAttrsToList
    foldl'
    setAttrByPath
    splitString
    hasSuffix
    hasPrefix
    removeSuffix
    ;
  inherit (builtins) readDir;
in
(fix (
  traverse: path: prefix:
  foldl' recursiveUpdate { } (
    mapAttrsToList (
      name: type:
      if type == "directory" then
        traverse (path + "/${name}") (if prefix == "" then name else "${prefix}.${name}")
      else if type == "regular" && hasSuffix ".nix" name && !hasPrefix "_" name then
        setAttrByPath (splitString "." (
          removeSuffix ".nix" (if prefix == "" then name else "${prefix}.${name}")
        )) (import (path + "/${name}"))
      else
        { }
    ) (readDir path)
  )
) modulesDir "")
