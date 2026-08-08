{
  flake.modules.nixos.core = {
    lib,
    hosts,
    global,
    routes,
    ...
  }: {
    options = {
      hosts = lib.mkOption {
        type = lib.types.attrsOf lib.types.unspecified;
        default = hosts;
      };
      global = lib.mkOption {
        type = lib.types.attrsOf lib.types.unspecified;
        default = global;
      };
      routes = lib.mkOption {
        type = lib.types.attrsOf lib.types.unspecified;
        default = routes;
      };
    };
  };
}
