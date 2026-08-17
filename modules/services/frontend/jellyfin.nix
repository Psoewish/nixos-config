{
  flake.modules.nixos.jellyfin = {
    services.jellyfin = {
      enable = true;
      group = "media";
      dataDir = "/var/lib/jellyfin";
    };
  };

  routes.jellyfin = {
    port = 8096;
    public = true;
  };
}
