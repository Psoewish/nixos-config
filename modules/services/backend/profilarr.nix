{
  flake.modules.nixos.profilarr = {config, ...}: {
    virtualisation.oci-containers.containers.profilarr = {
      hostname = "profilarr";
      image = "santiagosayshey/profilarr:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/profilarr:/config"
      ];
      extraOptions = ["--network=host"];
    };

    services.traefik.dynamicConfigOptions.http = let
      service = "profilarr";
      port = 6868;
    in {
      routers.${service} = {
        rule = "Host(`${service}.${config.global.domain}`)";
        service = service;
        entryPoints = ["websecure"];
      };
      services.${service}.loadBalancer.servers = [
        {url = "http://localhost:${toString port}";}
      ];
    };
  };
}
