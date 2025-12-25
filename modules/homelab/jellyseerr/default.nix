{ ... }:
{
  services.jellyseerr = {
    enable = true;
  };

  homelab.routes.jellyseerr = {
    subdomain = "jellyseerr";
    port = 5055;
    public = true;
  };
}
