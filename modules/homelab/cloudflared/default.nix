{ config, ... }:
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "${config.homelab.tunnelId}" = {
        credentialsFile = config.sops.secrets."cloudflare/credentials".path;
        default = "http_status:404";
        originRequest.noTLSVerify = true;
        ingress = lib.mkMerge (
          lib.mapAttrsToList (name: cfg: {
            "${cfg.subdomain}.${config.homelab.domain}" = "https://localhost:443";
          }) (lib.filterAttrs (name: cfg: cfg.public) config.homelab.routes)
        );
      };
    };
  };
}
