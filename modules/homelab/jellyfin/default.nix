{ ... }:
{
  services.jellyfin = {
    enable = true;
  };

  homelab.routes.jellyfin = {
    subdomain = "jellyfin";
    port = 8096;
    public = true;
  };
}
