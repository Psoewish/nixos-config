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
    globalCfg = cfg;
    hostCfg = cfg.hosts.${name};
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
    ++ (collectModules [ (discoverModules (hostsDir + "/${name}")) ])
    ++ (globalCfg.modules or [ ])
    ++ (hostCfg.modules or [ ])
    ++ (collectModules (globalCfg.tags or [ ]))
    ++ (collectModules (hostCfg.tags or [ ]));
  }
) cfg.hosts
