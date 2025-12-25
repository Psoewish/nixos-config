{ inputs, ... }:
{
  flake.nixosModules.overlays = {
    imports = [ (inputs.import-tree ../overlays) ];
  };
}
