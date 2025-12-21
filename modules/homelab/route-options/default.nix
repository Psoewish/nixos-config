{ lib, ... }:
{
  options.homelab.routes = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule (
        { name, ... }:
        {
          options = {
            service = lib.mkOption {
              type = lib.types.str;
              default = name;
              description = "Service name to be used in traefik router";
            };
            subdomain = lib.mkOption {
              type = lib.types.str;
              default = name;
              description = "Subdomain";
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
            domain = lib.mkOption {
              type = lib.types.str;
              default = "psoewish.com";
              description = "Domain";
            };
            tunnelId = lib.mkOption {
              type = lib.types.str;
              default = "009088b8-cd7c-41fb-b25d-2d34cd98bc6e";
              description = "Cloudflare tunnel ID";
            };
            forwardAuth = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = "Enable Authentik forward authentication";
            };
          };
        }
      )
    );
    default = { };
    description = "Routes to configure in traefik, blocky, and cloudflared";
  };
}
