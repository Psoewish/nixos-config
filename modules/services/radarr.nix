{
  flake.modules.nixos.radarr = {
    config,
    hosts,
    ...
  }: {
    virtualisation.oci-containers.containers.radarr = {
      name = "radarr";
      container = {
        image = "lscr.io/linuxserver/radarr:latest";
        pull = "always";
        environment = {
          PUID = "${hosts.homelab.users.media.id}";
          PGID = "${hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/radarr:/config"
          "/data/media/movies:/movies"
          "/data/downloads/usenet:/downloads/usenet"
          "/data/downloads/torrents:/downloads/torrents"
        ];
        extraOptions = ["--network=host"];
      };
    };

    services.caddy.virtualHosts = {
      "radarr.psoewish.com" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:7878
        '';
      };
    };
  };
}
