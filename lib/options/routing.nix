{lib, ...}: {
  options.routing = lib.mkOption {
    type = lib.types.submodule {
      freeformType = lib.types.attrsOf lib.types.unspecified;
      options = {
        domain = lib.mkOption {type = lib.types.str;};
        tunnelId = lib.mkOption {type = lib.types.str;};
        services = lib.mkOption {
          type = lib.types.attrsOf (lib.types.submoduleWith {
            modules = [
              (
                {name, ...}: {
                  options = {
                    service = lib.mkOption {
                      type = lib.types.str;
                      default = name;
                    };
                    aliases = lib.mkOption {
                      type = lib.types.listOf lib.types.str;
                      default = [];
                    };
                    port = lib.mkOption {type = lib.types.int;};
                    public = lib.mkOption {
                      type = lib.types.bool;
                      default = false;
                    };
                  };
                }
              )
            ];
          });
          default = {};
        };
      };
    };
  };
}
