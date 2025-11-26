{
  inputs,
  lib,
  mkRoute,
  ...
}:
lib.mkMerge [
  {
    imports = [ inputs.unmanic-nix.nixosModules.default ];
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
