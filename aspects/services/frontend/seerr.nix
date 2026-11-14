{
  den.aspects.services.frontend.seerr = {
    nixos = {
      services.seerr = {
        enable = true;
        configDir = "/var/lib/seerr";
      };
      services.traefik.dynamicConfigOptions.http = {
        routers.seerr = {
          service = "seerr";
          rule = "Host(`seerr.psoewish.com`)";
          entryPoints = ["websecure"];
        };
        services.seerr.loadBalancer.servers = ["http://localhost:5055"];
      };
      services.cloudflared.tunnels."009088b8-cd7c-41fb-b25d-2d34cd98bc6e".ingress = {
        seerr = {
          service = "https://localhost:443";
          originRequest.originServerName = "seerr.psoewish.com";
        };
      };
    };
  };
}
