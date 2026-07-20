inputs:
let
  inherit (inputs.nixpkgs.lib)
    hasSuffix
    hasPrefix
    mapAttrsToList
    extend
    composeManyExtensions
    ;
  inherit (builtins) concatMap readDir;

  loadExtensions =
    dir:
    concatMap (
      { name, type }:
      if type == "directory" then
        loadExtensions (dir + "/${name}")
      else if
        type == "regular" && hasSuffix ".nix" name && !hasPrefix "_" name && name != "default.nix"
      then
        [ (import (dir + "/${name}") inputs) ]
      else
        [ ]
    ) (mapAttrsToList (name: type: { inherit name type; }) (readDir dir));
in
extend (
  final: prev: {
    fractal = composeManyExtensions (loadExtensions ./.) final prev;
  }
)
