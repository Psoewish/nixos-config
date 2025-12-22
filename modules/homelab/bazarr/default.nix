{ ... }:
{
  services.bazarr = {
    enable = true;
    group = "media";
  };

  homelab.routes.bazarr = {
    subdomain = "bazarr";
    port = 6767;
    public = false;
    forwardAuth = true;
  };
}
