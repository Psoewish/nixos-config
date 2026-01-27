{
  name,
  container ? { },
  route ? { },
  ...
}:
{ config, lib, ... }:
let
  domain = "psoewish.com";
  tunnelId = "009088b8-cd7c-41fb-b25d-2d34cd98bc6e";
  FQDN = "${route.subdomain or name}.${domain}";
in
{
  virtualisation.oci-containers.containers = lib.mkIf (container != { }) {
    ${name} = (
      container
      // {
        environment = (container.environment or { }) // {
          PUID = "5000";
          PGID = "5000";
          TZ = config.time.timeZone;
        };
        extraOptions = [ "--network=host" ] ++ (container.extraOptions or [ ]);
      }
    );
  };

  services.caddy.virtualHosts = lib.mkIf (route != { }) {
    "${FQDN}" = {
      extraConfig =
        if (route.staticConfig or null) == null then
          ''
            import security_defaults
            import admin_redir
            reverse_proxy localhost:${toString route.port}
          ''
        else
          ''
            import security_defaults
            ${route.staticConfig}
          '';
    };
  };

  services.cloudflared.tunnels."${tunnelId}".ingress = lib.mkIf (route.public or false) {
    "${FQDN}" = {
      service = "https://localhost:443";
      originRequest.originServerName = "${FQDN}";
    };
  };
}
