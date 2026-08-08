{
  flake.modules.nixos.core = {
    lib,
    hosts,
    global,
    routes,
    ...
  }: {
    options.hosts = lib.mkOption {
      type = lib.types.attrsOf lib.types.unspecified;
      default = hosts;
    };
    options.global = lib.mkOption {
      type = lib.types.attrsOf lib.types.unspecified;
      default = global;
    };
    options.routes = lib.mkOption {
      type = lib.types.attrsOf lib.types.unspecified;
      default = routes;
    };
  };
}
