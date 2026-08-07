{
  flake.modules.nixos.jellyfin = {config, ...}: {
    virtualisation.oci-containers.containers.jellyfin = {
      name = "jellyfin";
      container = {
        image = "jellyfin/jellyfin:latest";
        pull = "always";
        environment = {
          PUID = "${config.hosts.homelab.users.media.id}";
          PGID = "${config.hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/jellyfin:/config"
          "/data/media/tv:/data/media/tv"
          "/data/media/movies:/data/media/movies"
        ];
        devices = ["/dev/dri:/dev/dri"];
        extraOptions = ["--network=host"];
      };
    };

    services.caddy.virtualHosts = {
      "jellyfin.${config.global.domain}" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:8096
        '';
      };
    };

    services.cloudflared.tunnels."${config.global.cloudflared.tunnelId}".ingress."jellyfin.${config.global.domain}" = {
      service = "https://localhost:443";
      originRequest.originServerName = "jellyfin.${config.global.domain}";
    };
  };
}
