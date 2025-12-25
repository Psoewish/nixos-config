{ inputs, ... }:
{
  flake.nixosModules.overrides = {
    imports = [ (inputs.import-tree ../overrides) ];
    disabledModules = [ "services/security/crowdsec.nix" ];
  };
}
