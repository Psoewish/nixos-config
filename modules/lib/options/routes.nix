{lib, ...}: {
  options.flake.routes = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule (
      {name, ...}: {
        options = {
          service = lib.mkOption {
            type = lib.types.str;
            default = name;
          };
          subdomain = lib.mkOption {
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
    ));
    default = {};
  };
}
