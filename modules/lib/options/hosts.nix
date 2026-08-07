{lib, ...}: {
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
