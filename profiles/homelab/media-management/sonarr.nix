{ lib, mkRoute, ... }:
lib.mkMerge [
  {
    services.sonarr = {
      enable = true;
    };
  }
  (mkRoute {
    service = "sonarr";
    subdomain = "sonarr";
    port = 8989;
    public = false;
  })
]
