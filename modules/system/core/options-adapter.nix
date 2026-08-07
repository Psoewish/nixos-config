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
      readOnly = true;
    };
    options.global = lib.mkOption {
      type = lib.types.attrsOf lib.types.unspecified;
      default = global;
      readOnly = true;
    };
  };
}
