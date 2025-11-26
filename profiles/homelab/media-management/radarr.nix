{ lib, mkRoute, ... }:
let
  serviceConfig = {
    services.radarr = {
      enable = true;
    };
  };
  routeConfig = mkRoute {
    service = "radarr";
    subdomain = "radarr";
    port = 7878;
    public = false;
  };
in
lib.mkMerge [
  serviceConfig
  routeConfig
]
