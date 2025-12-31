{ config, ... }:
{
  fractal.tags = [ "homelab" ];
  services.cloudflared = {
    enable = true;
    tunnels = {
      "009088b8-cd7c-41fb-b25d-2d34cd98bc6e" = {
        credentialsFile = config.sops.secrets."cloudflare/credentials".path;
        default = "http_status:404";
        originRequest.noTLSVerify = true;
      };
    };
  };
}
