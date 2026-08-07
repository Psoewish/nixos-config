{
  flake.modules.nixos.transmission = {config, ...}: {
    virtualisation.oci-containers.containers.transmission = {
      hostname = "transmission";
      image = "lscr.io/linuxserver/transmission:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/transmission:/config"
        "/data/downloads/torrents:/downloads/torrents"
      ];
      extraOptions = ["--network=host"];
    };

    services.traefik.dynamicConfigOptions.http = let
      service = "transmission";
      port = 9091;
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
