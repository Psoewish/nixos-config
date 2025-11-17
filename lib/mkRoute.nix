{ lib }:
let
  routingSecrets = import ../secrets/soft-secrets.nix;
in
{
  service,
  subdomain,
  domain ? routingSecrets.domain,
  tunnelId ? routingSecrets.tunnelId,
  port,
  public,
}:
let
  fqdn = "${subdomain}.${domain}";
in
{
  services = {
    blocky.settings.customDNS.mapping = {
      "${fqdn}" = "192.168.1.100";
    };
    traefik.dynamicConfigOptions = {
      http = {
        routers.${service} = {
          rule = "Host(`${fqdn}`)";
          service = service;
          entryPoints = [ "websecure" ];
          tls.certResolver = "cloudflare";
        };
        services.${service}.loadBalancer.servers = [
          { url = "http://localhost:${toString port}"; }
        ];
      };
    };
  }
  // lib.optionalAttrs public {
    cloudflared.tunnels."${tunnelId}".ingress."${fqdn}" = "https://localhost:443";
  };
}
