{
  flake.modules.nixos.sonarr = {config, ...}: {
    virtualisation.oci-containers.containers.sonarr = {
      name = "sonarr";
      container = {
        image = "lscr.io/linuxserver/sonarr:latest";
        pull = "always";
        environment = {
          PUID = "${config.hosts.homelab.users.media.id}";
          PGID = "${config.hosts.homelab.users.media.id}";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/sonarr:/config"
          "/data/media/tv:/tv"
          "/data/downloads/usenet:/downloads/usenet"
          "/data/downloads/torrents:/downloads/torrents"
        ];
        extraOptions = ["--network=host"];
      };
    };

    services.caddy.virtualHosts = {
      "sonarr.${config.global.domain}" = {
        extraConfig = ''
          import security_defaults
          reverse_proxy localhost:8989
        '';
      };
    };
  };
}
