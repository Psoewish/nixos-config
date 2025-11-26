{ lib, mkRoute, ... }:
let
  serviceConfig = {
    services.sonarr = {
      enable = true;
    };
  };

  routeConfig = mkRoute {
    service = "sonarr";
    subdomain = "sonarr";
    port = 8989;
    public = false;
  };
in
lib.mkMerge [
  serviceConfig
  routeConfig
]
