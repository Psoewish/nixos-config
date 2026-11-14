{
  den.aspects.services.backend.nzbhydra = {
    nixos = {
      services.nzbhydra2.enable = true;
      services.traefik.dynamicConfigOptions.http = {
        routers.nzbhydra2 = {
          service = "nzbhydra2";
          rule = "Host(`nzbhydra2.psoewish.com`) || Host(`nzbhydra.psoewish.com`)";
          entryPoints = ["websecure"];
        };
        services.nzbhydra2.loadBalancer.servers = [{url = "http://localhost:5076";}];
      };
    };
  };
}
