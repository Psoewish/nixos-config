{ lib, mkRoute, ... }:
lib.mkMerge [
  {
    services.radarr = {
      enable = true;
    };
  }
  (mkRoute {
    service = "radarr";
    subdomain = "radarr";
    port = 7878;
    public = false;
  })
]
