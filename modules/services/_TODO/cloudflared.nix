{
  flake.modules.nixos.cloudflared = {config, ...}: {
    services.cloudflared = {
      enable = true;
      tunnels."${config.global.cloudflared.tunnelId}" = {
        credentialsFile = config.sops.secrets."cloudflared/credentials".path;
        default = "http_status:404";
        originRequest.noTLSVerify = true;
      };
    };
  };
}
