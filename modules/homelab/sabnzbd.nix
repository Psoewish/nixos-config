{ meta, ... }:
{
  imports = [
    (meta.homelab.service {
      name = "sabnzbd";
      container = {
        image = "lscr.io/linuxserver/sabnzbd:latest";
        volumes = [
          "/var/lib/sabnzbd:/config"
          "/data/downloads/usenet:/downloads/usenet"
        ];
      };
      route.port = 8080;
    })
  ];
}
