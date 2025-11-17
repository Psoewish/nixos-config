{ lib, mkRoute, ... }:
lib.mkMerge [
  {
    services.jellyseerr = {
      enable = true;
    };
  }
  (mkRoute {
    service = "jellyseerr";
    subdomain = "jellyseerr";
    port = 5055;
    public = true;
  })
]
