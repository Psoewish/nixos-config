{ ... }:
{
  services.radarr = {
    enable = true;
  };

  homelab.routes.radarr = {
    subdomain = "radarr";
    port = 7878;
    public = false;
    forwardAuth = true;
  };
}
