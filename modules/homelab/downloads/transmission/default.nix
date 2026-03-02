{ meta, ... }:
{
  imports = [
    (meta.homelab.service {
      name = "transmission";
      container = {
        image = "lscr.io/linuxserver/transmission:latest";
        environment = {
          DOCKER_MODS = "linuxserver/mods:transmission-floodui";
        };
        volumes = [
          "/var/lib/transmission:/config"
          "/data/downloads/torrents:/downloads/torrents"
        ];
      };
      route.port = 9091;
    })
  ];
}
