{
  flake.modules.nixos.sabnzbd = {config, ...}: {
    virtualisation.oci-containers.containers.sabnzbd = {
      hostname = "sabnzbd";
      image = "lscr.io/linuxserver/sabnzbd:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/sabnzbd:/config"
        "/data/downloads/usenet:/downloads/usenet"
      ];
      extraOptions = ["--network=host"];
    };

    services.traefik.dynamicConfigOptions.http = let
      service = "nzbhydra";
      port = 8080;
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
