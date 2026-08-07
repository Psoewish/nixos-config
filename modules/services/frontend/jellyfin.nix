{
  flake.modules.nixos.jellyfin = {config, ...}: {
    virtualisation.oci-containers.containers.jellyfin = {
      hostname = "jellyfin";
      image = "jellyfin/jellyfin:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/jellyfin:/config"
        "/data/media/tv:/data/media/tv"
        "/data/media/movies:/data/media/movies"
      ];
      devices = ["/dev/dri:/dev/dri"];
      extraOptions = ["--network=host"];
    };

    services.traefik.dynamicConfigOptions.http = let
      service = "jellyfin";
      port = 8096;
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

    services.cloudflared.tunnels."${config.global.cloudflared.tunnelId}".ingress."jellyfin.${config.global.domain}" = {
      service = "https://localhost:443";
      originRequest.originServerName = "jellyfin.${config.global.domain}";
    };
  };
}
