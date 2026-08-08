{
  flake.modules.nixos.radarr = {
    services.radarr = {
      enable = true;
      group = "media";
      dataDir = "/var/lib/radarr";
    };
  };

  flake.routes.radarr = {
    port = 7878;
  };
}
