{
  lib,
  inputs,
  config,
  ...
}: {
  options.flake.hosts = lib.mkOption {
    type = lib.types.attrsOf (lib.types.attrsOf (lib.types.submoduleWith {
      modules = [
        ({name, ...}: {
          freeformType = lib.types.attrsOf lib.types.unspecified;
          options = {
            hostname = lib.mkOption {
              type = lib.types.str;
              default = name;
            };
            system = lib.mkOption {type = lib.types.str;};
            stateVersion = lib.mkOption {type = lib.types.str;};
            staticIp = lib.mkOption {type = lib.types.str;};
          };
        })
      ];
    }));
    default = {};
  };

  config.flake.nixosConfigurations = lib.mapAttrs (hostname: hostData:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        hosts = config.flake.hosts;
      };
      modules = [
        {
          networking.hostName = hostData.hostname;
          system.stateVersion = hostData.stateVersion;
          nixpkgs.hostPlatform = hostData.system;
        }
        config.flake.modules.nixos.core
        config.flake.modules.nixos.${hostname}
      ];
    })
  config.flake.hosts.nixos;
}
