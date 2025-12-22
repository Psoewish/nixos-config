{ ... }:
{
  services.sabnzbd = {
    enable = true;
    group = "media";
  };

  homelab.routes.sabnzbd = {
    subdomain = "sabnzbd";
    port = 8080;
    public = false;
    forwardAuth = true;
  };
}
