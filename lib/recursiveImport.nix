{ lib, ... }:
input:
let
  inherit (lib) hasSuffix hasPrefix mapAttrsToList;
  inherit (builtins) isPath concatMap readDir;

  list = if isPath input then [ input ] else input;

  traverse =
    path:
    concatMap (
      { name, type }:
      if type == "directory" then
        traverse (path + "/${name}")
      else if type == "regular" && hasSuffix ".nix" name && !hasPrefix "_" name then
        [ (import (path + "/${name}")) ]
      else
        [ ]
    ) (mapAttrsToList (name: type: { inherit name type; }) (readDir path));
in
concatMap traverse list
