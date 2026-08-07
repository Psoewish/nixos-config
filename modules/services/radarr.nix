{
  flake.modules.nixos.radarr = {config, ...}: {
    virtualisation.oci-containers.containers.radarr = {
      name = "radarr";
      container = {
        image = "lscr.io/linuxserver/radarr:latest";
        pull = "always";
        environment = {
          PUID = "${config.hosts.homelab.users.media.id}";
          PGID = "${config.hosts.homelab.users.media.id}";
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
      "radarr.${config.global.domain}" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:7878
        '';
      };
    };
  };
}
