inputs: final: prev: {
  mkHosts =
    hostsDir: cfg:
    let
      inherit (prev) nixosSystem;
      inherit (final.fractal) collectModules discoverModules;
      inherit (builtins) mapAttrs;
    in
    mapAttrs (
      name: _:
      let
        globalCfg = cfg.systems;
        hostCfg = cfg.systems.hosts.${name};
      in
      nixosSystem {
        lib = final;
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
    ) cfg.systems.hosts;
}
