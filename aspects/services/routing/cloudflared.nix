{
  den.aspects.services.routing.cloudflared = {
    nixos = {config, ...}: {
      services.cloudflared = {
        enable = true;
        tunnels."009088b8-cd7c-41fb-b25d-2d34cd98bc6e" = {
          credentialsFile = config.sops.secrets."cloudflared/credentials".path;
          default = "http_status:404";
          originRequest.noTLSVerify = true;
        };
      };
    };
  };
}
