{ lib, ... }:
src: cfg:
let
  inherit (lib.fractal) discoverModules mkHosts;
in
{
  nixosConfigurations = mkHosts (cfg.hostsDir or (src + "/hosts")) cfg.systems;
  nixosModules = discoverModules (cfg.modulesDir or (src + "/modules"));
}
