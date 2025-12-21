{ config, lib, ... }:
{
  services = lib.mkMerge (
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
              middlewares = lib.optional route.forwardAuth "authentik" ++ [ "secure-headers" ];
            };
          }
          // lib.optionalAttrs route.forwardAuth {
            "${route.service}-auth" = {
              rule = "Host(`${fqdn}`) && PathPrefix(`/outpost.goauthentik.io/`)";
              service = "authentik-outpost";
              entryPoints = [ "websecure" ];
              tls.certResolver = "cloudflare";
              priority = 100;
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
