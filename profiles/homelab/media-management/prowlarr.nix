{ lib, mkRoute, ... }:
let
  serviceConfig = {
    services.prowlarr = {
      enable = true;
    };
  };

  routeConfig = mkRoute {
    service = "prowlarr";
    subdomain = "prowlarr";
    port = 9696;
    public = false;
  };
in
lib.mkMerge [
  serviceConfig
  routeConfig
]
