{
  inputs,
  lib,
  ...
}: let
  inherit (lib) nameValuePair removeSuffix listToAttrs;
in {
  imports = [inputs.flake-parts.flakeModules.modules];
  flake.modules.nixos = listToAttrs (map
    (file: nameValuePair (removeSuffix ".nix" (baseNameOf file)) file)
    (inputs.import-tree.leaves ../modules));
}
