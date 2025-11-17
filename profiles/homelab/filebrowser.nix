{ lib, mkRoute, ... }:
lib.mkMerge [
  {
    services.filebrowser = {
      enable = true;
      settings = {
        address = "0.0.0.0";
        port = 8181;
        root = "/";
      };
      user = "root";
    };
  }
  (mkRoute {
    service = "filebrowser";
    subdomain = "files";
    port = 8181;
    public = false;
  })
]
