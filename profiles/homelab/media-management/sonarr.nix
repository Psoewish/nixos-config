{ ... }:
{
  services.sonarr = {
    enable = true;
  };

  homelab.routes.sonarr = {
    subdomain = "sonarr";
    port = 8989;
    public = false;
  };
}
