{ lib, mkRoute, ... }:
let
  serviceConfig = {
    services.jellyseerr = {
      enable = true;
    };
  };

  routeConfig = mkRoute {
    service = "jellyseerr";
    subdomain = "jellyseerr";
    port = 5055;
    public = true;
  };
in
lib.mkMerge [
  serviceConfig
  routeConfig
]
