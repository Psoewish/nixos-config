{
  den.aspects.services.frontend.jellyfin = {
    nixos = {
      services.jellyfin = {
        enable = true;
        group = "media";
        dataDir = "/var/lib/jellyfin";
      };
      services.traefik.dynamicConfigOptions.http = {
        routers.jellyfin = {
          service = "jellyfin";
          rule = "Host(`jellyfin.psoewish.com`)";
          entryPoints = ["websecure"];
        };
        services.jellyfin.loadBalancer.servers = [{url = "http://localhost:8096";}];
      };
      services.cloudflared.tunnels."009088b8-cd7c-41fb-b25d-2d34cd98bc6e".ingress = {
        jellyfin = {
          service = "https://localhost:443";
          originRequest.originServerName = "jellyfin.psoewish.com";
        };
      };
    };
  };
}
