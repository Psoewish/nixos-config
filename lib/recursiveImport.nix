{ lib, ... }:
list:
let
  inherit (lib) hasSuffix hasPrefix;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (builtins)
    filter
    isPath
    concatMap
    readFileType
    ;
in
filter
  (
    elem:
    if !isPath elem then
      true
    else
      hasSuffix ".nix" (baseNameOf (toString elem)) && !hasPrefix "_" (baseNameOf (toString elem))
  )
  (
    concatMap (
      elem: if !isPath elem || readFileType elem != "directory" then [ elem ] else listFilesRecursive elem
    ) list
  )
