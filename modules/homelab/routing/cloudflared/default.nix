{ config, ... }:
{
  services.cloudflared = {
    enable = true;
    tunnels."${config.homelab.tunnelId}" = {
      credentialsFile = config.sops.secrets."cloudflared/credentials".path;
      default = "http_status:404";
      originRequest.noTLSVerify = true;
    };
  };
}
