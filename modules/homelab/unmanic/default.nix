{ inputs, ... }:
{
  imports = [ inputs.unmanic-nix.nixosModules.default ];
  services.unmanic = {
    enable = true;
    group = "media";
  };

  homelab.routes.unmanic = {
    subdomain = "unmanic";
    port = 8888;
    public = false;
    forwardAuth = true;
  };
}
