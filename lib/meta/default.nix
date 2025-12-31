{ lib, ... }:
{
  options.fractal = lib.mkOption {
    type = lib.types.submodule {
      options = {
        tags = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
          description = "Tag for the module";
        };
      };
    };
    default = { };
    description = "Metadata for the module";
  };
}
