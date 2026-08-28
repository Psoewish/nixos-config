{
  inputs,
  lib,
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
            specialArgs = lib.mkOption {
              type = lib.types.attrsOf lib.types.unspecified;
              default = {};
            };
            system = lib.mkOption {type = lib.types.str;};
            stateVersion = lib.mkOption {type = lib.types.str;};
          };
        })
      ];
    }));
    default = {};
  };

  config.flake.nixosConfigurations = lib.mapAttrs (hostname: hostData:
    inputs.nixpkgs.lib.nixosSystem {
      system = hostData.system; # For legacy support
      specialArgs = {inherit inputs;} // hostData.specialArgs;
      modules = [
        {
          # Host setup
          networking.hostName = hostData.hostname;
          system.stateVersion = hostData.stateVersion;
          nixpkgs.hostPlatform = hostData.system;

          # Primary user setup
          users.groups.${config.flake.metadata.primaryUser.username} = {};
          users.users.${config.flake.metadata.primaryUser.username} = {
            group = "${config.flake.metadata.primaryUser.username}";
            isNormalUser = true;
            extraGroups =
              [
                "wheel"
                "networkmanager"
              ]
              ++ (config.flake.metadata.primaryUser.extraGroups or []);
            shell = inputs.nixpkgs.legacyPackages.${hostData.system}.${config.flake.metadata.primaryUser.shell};
          };
        }
        config.flake.modules.nixos.${hostname}
        config.flake.modules.nixos.shared
      ];
    })
  config.flake.hosts.nixos;
}
