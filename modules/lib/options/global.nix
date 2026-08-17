{lib, ...}: {
  options.global = lib.mkOption {
    type = lib.types.attrsOf lib.types.unspecified;
    default = {};
  };
}
