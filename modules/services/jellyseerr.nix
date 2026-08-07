{
  flake.modules.nixos.jellyseerr = {config, ...}: {
    virtualisation.oci-containers.containers.jellyseerr = {
      name = "jellyseerr";
      container = {
        image = "ghcr.io/seerr-team/seerr:latest";
        pull = "always";
        environment = {
          PUID = "${config.hosts.homelab.users.media.id}";
          PGID = "${config.hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/jellyseerr:/app/config"
        ];
        extraOptions = ["--network=host" "--init"];
      };
    };

    services.caddy.virtualHosts = {
      "jellyseerr.${config.global.domain}" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:5055
        '';
      };
    };

    services.cloudflared.tunnels."${config.global.cloudflared.tunnelId}".ingress."jellyseerr.${config.global.domain}" = {
      service = "https://localhost:443";
      originRequest.originServerName = "jellyseerr.${config.global.domain}";
    };
  };
}
