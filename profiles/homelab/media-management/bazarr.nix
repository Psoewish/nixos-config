{ lib, mkRoute, ... }:
let
  serviceConfig = {
    services.bazarr = {
      enable = true;
    };
  };

  routeConfig = mkRoute {
    service = "bazarr";
    subdomain = "bazarr";
    port = 6767;
    public = false;
  };
in
lib.mkMerge [
  serviceConfig
  routeConfig
]
