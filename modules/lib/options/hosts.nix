{lib, ...}: {
  options.hosts = lib.mkOption {
    type = lib.types.attrsOf (lib.types.attrsOf (lib.types.submoduleWith {
      modules = [
        ({
          name,
          config,
          ...
        }: {
          freeformType = lib.types.attrsOf lib.types.unspecified;
          options = {
            hostname = lib.mkOption {
              type = lib.types.str;
              default = name;
            };
            primaryUser = lib.mkOption {
              type = lib.types.str;
              default = let
                primary = lib.attrNames (lib.filterAttrs (_: u: u.isPrimary) config.users);
              in
                if primary == []
                then
                  throw
                  "Host '${name}' has no primary user defined"
                else if lib.length primary > 1
                then throw "Host '${name}' has multiple primary users defines: ${toString primary}"
                else lib.head primary;
            };
            system = lib.mkOption {type = lib.types.str;};
            stateVersion = lib.mkOption {type = lib.types.str;};
            staticIp = lib.mkOption {type = lib.types.str;};
            pubKey = lib.mkOption {type = lib.types.str;};
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
                      id = lib.mkOption {
                        type = lib.types.nullOr lib.types.int;
                      };
                      isPrimary = lib.mkOption {
                        type = lib.types.bool;
                        default = false;
                      };
                      isAdmin = lib.mkOption {
                        type = lib.types.bool;
                        default = false;
                      };
                      enableHomeManager = lib.mkOption {
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
}
