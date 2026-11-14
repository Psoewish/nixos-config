{
  den.aspects.services.backend.profilarr = {
    nixos = {config, ...}: {
      virtualisation.oci-containers.containers.profilearr = {
        hostname = "profilarr";
        image = "ghcr.io/dictionarry-hub/profilarr:latest";
        pull = "always";
        environment = {
          PUID = toString config.users.users.media.uid;
          PGID = toString config.users.groups.media.gid;
          ORIGIN = "https://profilarr.psoewish.com";
          AUTH = "off";
          TZ = config.time.timeZone;
        };
        volumes = [
          "/var/lib/profilarr:/config"
        ];
        extraOptions = ["--network=host"];
      };
      services.traefik.dynamicConfigOptions.http = {
        routers.profilarr = {
          service = "profilarr";
          rule = "Host(`profilarr.psoewish.com`)";
          entryPoints = ["websecure"];
        };
        services.profilarr.loadBalancer.servers = [{url = "http://localhost:6868";}];
      };
    };
  };
}
