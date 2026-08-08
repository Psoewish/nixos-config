{
  flake.modules.nixos.core = {
    lib,
    hosts,
    global,
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
  };
}
