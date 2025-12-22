{ pkgs, ... }:
{
  services.transmission = {
    enable = true;
    group = "media";
    downloadDirPermissions = "770";
    webHome = pkgs.flood-for-transmission;
    settings = {
      watch-dir-enabled = true;
      rpc-whitelist-enabled = false;
      rpc-host-whitelist-enabled = false;
    };
  };

  homelab.routes.transmission = {
    subdomain = "transmission";
    port = 9091;
    public = false;
    forwardAuth = true;
  };
}
