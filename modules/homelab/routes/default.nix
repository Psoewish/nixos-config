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
          routers.${route.service} = {
            rule = "Host(`${fqdn}`)";
            service = route.service;
            entryPoints = [ "websecure" ];
            tls.certResolver = "cloudflare";
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
