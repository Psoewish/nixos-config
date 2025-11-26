{
  lib,
  mkRoute,
  ...
}:
let
  serviceConfig = {
    services.unmanic = {
      enable = true;
    };
  };

  routeConfig = mkRoute {
    service = "unmanic";
    subdomain = "unmanic";
    port = 8888;
    public = false;
  };
in
lib.mkMerge [
  serviceConfig
  routeConfig
]
