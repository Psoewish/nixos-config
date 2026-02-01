{ meta, ... }:
{
  imports = [
    (meta.homelab.service {
      name = "jellyseerr";
      container = {
        image = "ghcr.io/fallenbagel/jellyseerr:latest";
        volumes = [
          "/var/lib/jellyseerr:/app/config"
        ];
      };
      route = {
        port = 5055;
        public = true;
      };
    })
  ];
}
