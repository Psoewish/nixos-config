{lib, ...}: {
  options.flake.metadata = lib.mkOption {
    type = lib.types.attrsOf lib.types.unspecified;
    default = {};
  };
}
