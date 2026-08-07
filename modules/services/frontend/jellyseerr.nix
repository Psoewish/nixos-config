{
  flake.modules.nixos.jellyseerr = {config, ...}: {
    virtualisation.oci-containers.containers.jellyseerr = {
      hostname = "jellyseerr";
      image = "ghcr.io/seerr-team/seerr:latest";
      pull = "always";
      environment = {
        PUID = toString config.hosts.homelab.users.media.id;
        PGID = toString config.hosts.homelab.users.media.id;
        TZ = config.time.timeZone;
      };
      volumes = [
        "/var/lib/jellyseerr:/app/config"
      ];
      extraOptions = ["--network=host" "--init"];
    };

    services.traefik.dynamicConfigOptions.http = let
      service = "jellyseerr";
      port = 5055;
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

    services.cloudflared.tunnels."${config.global.cloudflared.tunnelId}".ingress."jellyseerr.${config.global.domain}" = {
      service = "https://localhost:443";
      originRequest.originServerName = "jellyseerr.${config.global.domain}";
    };
  };
}
