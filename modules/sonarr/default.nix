{ ... }:
{
  fractal.tags = [ "homelab" ];
  services.sonarr = {
    enable = true;
    group = "media";
  };

  homelab.routes.sonarr = {
    subdomain = "sonarr";
    port = 8989;
    public = false;
    forwardAuth = true;
  };
}
