{
  flake.modules.nixos.sonarr = {config,...}:{
    services.sonarr = {
      enable = true;
      group = "media";
      dataDir = "/var/lib/sonarr";
      environmentFiles = [config.age.secrets.sonarr_api.path];
    };
  };

  routes.sonarr = {
    port = 8989;
  };
}
