{
  inputs,
  lib,
  ...
}: let
  inherit (lib) nameValuePair removeSuffix listToAttrs;
in {
  imports = [inputs.devshell.flakeModule];
  perSystem.devshells = listToAttrs (map
    (file:
      nameValuePair
      (removeSuffix ".nix" (baseNameOf file))
      file)
    (inputs.import-tree.leaves ../devShells));
}
