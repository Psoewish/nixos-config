{ lib, mkRoute, ... }:
lib.mkMerge [
  {
    services.sabnzbd = {
      enable = true;
    };
  }
  (mkRoute {
    service = "sabnzbd";
    subdomain = "sabnzbd";
    port = 8080;
    public = false;
  })
]
