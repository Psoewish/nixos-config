{ lib, mkRoute, ... }:
lib.mkMerge [
  {
    services.bazarr = {
      enable = true;
    };
  }
  (mkRoute {
    service = "bazarr";
    subdomain = "bazarr";
    port = 6767;
    public = false;
  })
]
