{ lib, ... }:
src: cfg:
let
  inherit (lib.fractal) discoverModules mkHosts recursiveImport;
  cfg' = cfg // {
    options = recursiveImport (cfg.optionsDir or (src + "/options"));
  };
in
{
  nixosConfigurations = mkHosts (cfg.hostsDir or (src + "/hosts")) cfg';
  nixosModules = discoverModules (cfg.modulesDir or (src + "/modules"));
}
