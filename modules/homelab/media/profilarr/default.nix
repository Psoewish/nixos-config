{ meta, ... }:
{
  imports = [
    (meta.homelab.service {
      name = "profilarr";
      container = {
        image = "santiagosayshey/profilarr:latest";
        volumes = [
          "/var/lib/profilarr:/config"
        ];
      };
      route.port = 6868;
    })
  ];
}
