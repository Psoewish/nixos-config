{ lib, mkRoute, ... }:
lib.mkMerge [
  {
    services.prowlarr = {
      enable = true;
    };
  }
  (mkRoute {
    service = "prowlarr";
    subdomain = "prowlarr";
    port = 9696;
    public = false;
  })
]
