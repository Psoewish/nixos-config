{
  flake.modules.nixos.radarr = {config,...}:{
    services.radarr = {
      enable = true;
      group = "media";
      dataDir = "/var/lib/radarr";
      environmentFiles = [config.age.secrets.radarr_api.path];
    };
  };

  routes.radarr = {
    port = 7878;
  };
}
