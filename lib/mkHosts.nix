{ inputs, lib, ... }:
hostsDir: cfg:
let
  inherit (lib) nixosSystem;
  inherit (lib.fractal) collectModules discoverModules;
  inherit (builtins) mapAttrs;
in
mapAttrs (
  name: _:
  let
    globalCfg = cfg.systems;
    hostCfg = cfg.systems.hosts.${name};
  in
  nixosSystem {
    specialArgs = {
      inherit inputs;
    }
    // (globalCfg.specialArgs or { })
    // (hostCfg.specialArgs or { });
    modules = [
      { networking.hostName = name; }
    ]
    ++ cfg.options
    ++ (collectModules [ (discoverModules (hostsDir + "/${name}")) ])
    ++ (hostCfg.modules or [ ])
    ++ (collectModules (hostCfg.tags or [ ]));
  }
) cfg.systems.hosts
