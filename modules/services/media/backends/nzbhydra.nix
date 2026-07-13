{ meta, ... }:
{
  imports = [
    (meta.homelab.service {
      name = "nzbhydra";
      container = {
        image = "lscr.io/linuxserver/nzbhydra2:latest";
        volumes = [
          "/var/lib/nzbhydra2:/config"
        ];
      };
      route.port = 5076;
    })
  ];
}
