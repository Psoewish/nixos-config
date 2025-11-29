{ ... }:
{
  services.sabnzbd = {
    enable = true;
  };

  homelab.routes.sabnzbd = {
    subdomain = "sabnzbd";
    port = 8080;
    public = false;
  };
}
