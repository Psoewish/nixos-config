{
  den.aspects.services.backend.prowlarr = {
    nixos = {config, ...}: {
      services.prowlarr = {
        enable = true;
        environmentFiles = [config.sops.secrets."prowlarr/api".path];
      };
      services.traefik.dynamicConfigOptions.http = {
        routers.prowlarr = {
          service = "prowlarr";
          rule = "Host(`prowlarr.psoewish.com`)";
          entryPoints = ["websecure"];
        };
        services.prowlarr.loadBalancer.servers = [{url = "http://localhost:9696";}];
      };
    };
  };
}
