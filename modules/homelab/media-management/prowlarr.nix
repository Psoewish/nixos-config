{ ... }:
{
  services.prowlarr = {
    enable = true;
  };

  homelab.routes.prowlarr = {
    subdomain = "prowlarr";
    port = 9696;
    public = false;
  };
}
