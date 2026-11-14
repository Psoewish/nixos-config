{
  den.aspects.services.backend.transmission = {
    nixos = {pkgs, ...}: {
      services.transmission = {
        enable = true;
        group = "media";
        webHome = pkgs.flood-for-transmission;
        settings = {
          download-dir = "/data/downloads/torrents/complete";
          incomplete-dir = "/data/downloads/torrents/incomplete";
        };
      };
      services.traefik.dynamicConfigOptions.http = {
        routers.transmission = {
          service = "transmission";
          rule = "Host(`transmission.psoewish.com`)";
          entryPoints = ["websecure"];
        };
        services.transmission.loadBalancer.servers = ["http://localhost:9091"];
      };
    };
  };
}
