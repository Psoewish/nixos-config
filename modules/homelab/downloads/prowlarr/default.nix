{ meta, ... }:
{
  imports = [
    (meta.homelab.service {
      name = "prowlarr";
      container = {
        image = "lscr.io/linuxserver/prowlarr:latest";
        volumes = [
          "/var/lib/prowlarr:/config"
        ];
      };
      route.port = 9696;
    })
  ];
}
