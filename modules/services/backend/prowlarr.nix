{
  flake.modules.nixos.prowlarr = {config, ...}: {
    virtualisation.oci-containers.containers.prowlarr = {
      hostname = "prowlarr";
      image = "lscr.io/linuxserver/prowlarr:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/prowlarr:/config"
      ];
      extraOptions = ["--network=host"];
    };

    services.traefik.dynamicConfigOptions.http = let
      service = "prowlarr";
      port = 9696;
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
