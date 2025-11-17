{ lib, mkRoute, ... }:
lib.mkMerge [
  {
    services.jellyfin = {
      enable = true;
    };
  }
  (mkRoute {
    service = "jellyfin";
    subdomain = "jellyfin";
    port = 8096;
    public = true;
  })
]
