{ ... }:
{
  fractal.tags = [ "homelab" ];
  services.nzbhydra2 = {
    enable = true;
  };

  homelab.routes.nzbhydra = {
    subdomain = "nzbhydra";
    port = 5076;
    public = false;
    forwardAuth = true;
  };
}
