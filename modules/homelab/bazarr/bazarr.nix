{ ... }:
{
  services.bazarr = {
    enable = true;
  };

  homelab.routes.bazarr = {
    subdomain = "bazarr";
    port = 6767;
    public = false;
  };
}
