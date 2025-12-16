{ inputs, ... }:
{
  imports = [ inputs.unmanic-nix.nixosModules.default ];
  services.unmanic = {
    enable = true;
  };

  homelab.routes.unmanic = {
    subdomain = "unmanic";
    port = 8888;
    public = false;
  };
}
