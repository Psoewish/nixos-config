{ meta, ... }:
{
  imports = [
    (meta.homelab.service {
      name = "radarr";
      container = {
        image = "lscr.io/linuxserver/radarr:latest";
        volumes = [
          "/var/lib/radarr:/config"
          "/data/media/movies:/movies"
          "/data/downloads/usenet:/downloads/usenet"
          "/data/downloads/torrents:/downloads/torrents"
        ];
      };
      route.port = 7878;
    })
  ];
}
