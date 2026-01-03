{ config, lib, ... }:
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
          };
        }
      )
    );
    default = { };
    description = "Routes to configure in traefik, blocky, and cloudflared";
  };

  config.services = lib.mkMerge (
    lib.mapAttrsToList (
      name: route:
      let
        fqdn = "${route.subdomain}.${route.domain}";
      in
      {
        blocky.settings.customDNS.mapping = {
          "${fqdn}" = "192.168.1.100";
        };
        traefik.dynamicConfigOptions.http = {
          routers = {
            ${route.service} = {
              rule = "Host(`${fqdn}`)";
              service = route.service;
              entryPoints = [ "websecure" ];
              tls.certResolver = "cloudflare";
              middlewares = [ "secure-headers" ];
            };
          };
          services.${route.service}.loadBalancer.servers = [
            { url = "http://localhost:${toString route.port}"; }
          ];
        };
      }
      // lib.optionalAttrs route.public {
        cloudflared.tunnels."${route.tunnelId}".ingress."${fqdn}" = "https://localhost:443";
      }
    ) config.homelab.routes
  );
}
