{
  den.aspects.services.backend.sonarr = {
    nixos = {config, ...}: {
      services.sonarr = {
        enable = true;
        group = "media";
        dataDir = "/var/lib/sonarr";
        environmentFiles = [config.sops.secrets."sonarr/api".path];
      };
      services.traefik.dynamicConfigOptions.http = {
        routers.sonarr = {
          service = "sonarr";
          rule = "Host(`sonarr.psoewish.com`)";
          entryPoints = ["websecure"];
        };
        services.sonarr.loadBalancer.servers = [{url = "http://localhost:8989";}];
      };
    };
  };
}
