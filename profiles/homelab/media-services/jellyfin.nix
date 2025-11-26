{ lib, mkRoute, ... }:
let
  serviceConfig = {
    services.jellyfin = {
      enable = true;
    };
  };

  routeConfig = mkRoute {
    service = "jellyfin";
    subdomain = "jellyfin";
    port = 8096;
    public = true;
  };
in
lib.mkMerge [
  serviceConfig
  routeConfig
]
