{ ... }:
{
  services.jellyfin = {
    enable = true;
    group = "media";
  };

  homelab.routes.jellyfin = {
    subdomain = "jellyfin";
    port = 8096;
    public = true;
  };
}
