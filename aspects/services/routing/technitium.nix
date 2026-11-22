{
  den.aspects.services.routing.technitium = {
    nixos = {
      virtualisation.oci-containers.containers.technitium = {
        image = "docker.io/technitium/dns-server:latest";
        volumes = [
          "/var/lib/technitium:/etc/dns"
          "/var/log/technitium:/var/log/technitium/dns"
        ];
        ports = [
          "53:53/udp"
          "53:53/tcp"
        ];
        labels = {
          "traefik.enable" = "true";
          "traefik.http.routers.technitium.rule" = "Host(`technitium.psoewish.com`)";
          "traefik.http.services.technitium.loadbalancer.server.port" = "5380";
        };
      };
    };
  };
}
