{ meta, ... }:
{
  imports = [
    (meta.homelab.service {
      name = "jellyseerr";
      container = {
        image = "ghcr.io/seerr-team/seerr:latest";
        volumes = [
          "/var/lib/jellyseerr:/app/config"
        ];
        extraOptions = [ "--init" ];
      };
      route = {
        port = 5055;
        public = true;
      };
    })
  ];
}
