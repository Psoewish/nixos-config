{
  den.aspects.services.backend.radarr = {
    nixos = {config, ...}: {
      services.radarr = {
        enable = true;
        group = "media";
        dataDir = "/var/lib/radarr";
        environmentFiles = [config.sops.secrets."radarr/api".path];
      };
      services.traefik.dynamicConfigOptions.http = {
        routers.radarr = {
          service = "radarr";
          rule = "Host(`radarr.psoewish.com`)";
          entryPoints = ["websecure"];
        };
        services.radarr.loadBalancer.servers = [{url = "http://localhost:7878";}];
      };
    };
  };
}
