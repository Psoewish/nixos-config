{
  flake.modules.nixos.jellyfin = {
    config,
    hosts,
    ...
  }: {
    virtualisation.oci-containers.containers.jellyseerr = {
      name = "jellyseerr";
      container = {
        image = "ghcr.io/seerr-team/seerr:latest";
        pull = "always";
        environment = {
          PUID = "${hosts.homelab.users.media.id}";
          PGID = "${hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/jellyseerr:/app/config"
        ];
        extraOptions = ["--network=host" "--init"];
      };
    };

    services.caddy.virtualHosts = {
      "jellyseerr.psoewish.com" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:5055
        '';
      };
    };

    services.cloudflared.tunnels."009088b8-cd7c-41fb-b25d-2d34cd98bc6e".ingress."jellyseerr.psoewish.com" = {
      service = "https://localhost:443";
      originRequest.originServerName = "jellyseerr.psoewish.com";
    };
  };
}
