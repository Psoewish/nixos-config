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
            users = lib.mkOption {
              type = lib.types.attrsOf (lib.types.submoduleWith {
                modules = [
                  ({name, ...}: {
                    freeformType = lib.types.attrsOf lib.types.unspecified;
                    options = {
                      username = lib.mkOption {
                        type = lib.types.str;
                        default = name;
                      };
                      isPrimary = lib.mkOption {
                        type = lib.types.bool;
                        default = false;
                      };
                      shell = lib.mkOption {
                        type = lib.types.str;
                        default = "bash";
                      };
                      extraGroups = lib.mkOption {
                        type = lib.types.listOf lib.types.str;
                        default = [];
                      };
                    };
                  })
                ];
              });
            };
          };
        })
      ];
    }));
    default = {};
  };

  config.flake.nixosConfigurations = lib.mapAttrs (hostname: hostData:
    inputs.nixpkgs.lib.nixosSystem {
      system = hostData.system; # For legacy support
      specialArgs = {
        inherit inputs;
        hosts = config.flake.hosts;
      };
      modules =
        [
          {
            # System setup
            networking.hostName = hostData.hostname;
            system.stateVersion = hostData.stateVersion;
            nixpkgs.hostPlatform = hostData.system;
            security.sudo.wheelNeedsPassword = false;

            # User setup
            users.groups = lib.mapAttrs (username: userData: {}) hostData.users;
            users.users =
              lib.mapAttrs (username: userData: {
                group = username;
                description = username;
                isNormalUser = userData.isPrimary;
                isSystemUser = !userData.isPrimary;
                shell = inputs.nixpkgs.legacyPackages.${hostData.system}.${userData.shell};
                extraGroups = userData.extraGroups ++ lib.optionals userData.isPrimary ["wheel" "networkmanager"];
              })
              hostData.users;

            nix.settings.trusted-users = ["root"] ++ lib.attrNames (lib.filterAttrs (username: userData: userData.isPrimary) hostData.users);

            home-manager.users = lib.mapAttrs (username: userData: {
              home = {
                inherit username;
                homeDirectory = "/home/${username}";
                stateVersion = hostData.stateVersion;
              };
            }) (lib.filterAttrs (username: userData: userData.isPrimary) hostData.users);
          }
        ]
        ++ [
          config.flake.modules.nixos.core
          config.flake.modules.nixos.${hostname}
        ];
    })
  config.flake.hosts.nixos;
}
