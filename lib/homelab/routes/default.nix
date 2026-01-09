{ config, lib, ... }:
{
  options.homelab = {
    domain = lib.mkOption {
      type = lib.types.str;
      default = "psoewish.com";
      readOnly = true;
      description = "Domain name";
    };

    tunnelId = lib.mkOption {
      type = lib.types.str;
      default = "009088b8-cd7c-41fb-b25d-2d34cd98bc6e";
      readOnly = true;
      description = "Cloudflare tunnel ID";
    };

    routes = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule (
          { name, ... }:
          {
            options = {
              subdomain = lib.mkOption {
                type = lib.types.str;
                default = name;
                description = "Subdomain";
              };
              aliases = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                default = [ ];
                description = "Additional aliases for the service";
              };
              port = lib.mkOption {
                type = lib.types.port;
                description = "Local port the service listens on";
              };
              public = lib.mkOption {
                type = lib.types.bool;
                default = false;
                description = "Whether to expose service to cloudflare tunnel";
              };
            };
          }
        )
      );
      default = { };
      description = "Routing information for services";
    };
  };

  config = {
  };
}
