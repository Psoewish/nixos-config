{ meta, ... }:
{
  imports = [
    (meta.homelab.service {
      name = "qbittorrent";
      container = {
        image = "lscr.io/linuxserver/qbittorrent:latest";
        volumes = [
          "/var/lib/qbittorrent:/config"
          "/data/downloads/torrents:/downloads/torrents"
        ];
      };
      route.port = 8080;
    })
  ];
}
