{
  flake.modules.nixos.jellyfin = {
    config,
    hosts,
    ...
  }: {
    virtualisation.oci-containers.containers.jellyfin = {
      name = "jellyfin";
      container = {
        image = "jellyfin/jellyfin:latest";
        pull = "always";
        environment = {
          PUID = "${hosts.homelab.users.media.id}";
          PGID = "${hosts.homelab.users.media.id}";
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
      "jellyfin.psoewish.com" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:8096
        '';
      };
    };

    services.cloudflared.tunnels."009088b8-cd7c-41fb-b25d-2d34cd98bc6e".ingress."jellyfin.psoewish.com" = {
      service = "https://localhost:443";
      originRequest.originServerName = "jellyfin.psoewish.com";
    };
  };
}
