{
  flake.modules.nixos.core = {
    hosts,
    global,
    lib,
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
