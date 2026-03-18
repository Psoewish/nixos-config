{ meta, ... }:
{
  imports = [
    (meta.homelab.service {
      name = "searx";
      container = {
        image = "searx/searx:latest";
        environment = {
          BIND_ADDRESS = "0.0.0.0:8181";
        };
        volumes = [
          "/var/lib/searx:/etc/searx"
        ];
      };
      route = {
        port = 8181;
        public = false;
      };
    })
  ];
}
