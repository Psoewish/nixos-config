{ config, ... }:
{
  services.mydia = {
    enable = true;
    host = "mydia.psoewish.com";
    port = 4444;
    group = "media";
    secretKeyBaseFile = config.sops.secrets."mydia/secretKeyBase".path;
  };

  homelab.routes.mydia = {
    subdomain = "mydia";
    port = 4444;
    public = false;
  };
}
