{
  flake.modules.nixos.sonarr = {config, ...}: {
    virtualisation.oci-containers.containers.sonarr = {
      hostname = "sonarr";
      image = "lscr.io/linuxserver/sonarr:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/sonarr:/config"
        "/data/media/tv:/tv"
        "/data/downloads/usenet:/downloads/usenet"
        "/data/downloads/torrents:/downloads/torrents"
      ];
      extraOptions = ["--network=host"];
    };

    services.traefik.dynamicConfigOptions.http = let
      service = "sonarr";
      port = 8989;
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
