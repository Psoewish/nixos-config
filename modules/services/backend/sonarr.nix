{
  flake.modules.nixos.sonarr = {
    services.sonarr = {
      enable = true;
      group = "media";
      dataDir = "/var/lib/sonarr";
    };
  };

  flake.routes.sonarr = {
    port = 8989;
  };
}
