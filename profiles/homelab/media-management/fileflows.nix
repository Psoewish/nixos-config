{ lib, mkRoute, ... }:
lib.mkMerge [
  {
    services.fileflows = {
      enable = true;
    };
  }
  (mkRoute {
    service = "fileflows";
    subdomain = "fileflows";
    port = 19200;
    public = false;
  })
]
