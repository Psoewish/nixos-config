{ lib, mkRoute, ... }:
let
  serviceConfig = {
    services.sabnzbd = {
      enable = true;
    };
  };

  routeConfig = mkRoute {
    service = "sabnzbd";
    subdomain = "sabnzbd";
    port = 8080;
    public = false;
  };
in
lib.mkMerge [
  serviceConfig
  routeConfig
]
