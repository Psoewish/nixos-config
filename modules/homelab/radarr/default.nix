{ ... }:
{
  services.radarr = {
    enable = true;
    group = "media";
  };

  homelab.routes.radarr = {
    subdomain = "radarr";
    port = 7878;
    public = false;
  };
}
