{
  mkRoute,
  lib,
  ...
}:
lib.mkMerge [
  {
    services.unmanic = {
      enable = true;
    };
  }
  (mkRoute {
    service = "unmanic";
    subdomain = "unmanic";
    port = 8888;
    public = false;
  })
]
