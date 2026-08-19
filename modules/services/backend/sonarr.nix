{
  flake.modules.nixos.sonarr = {config,...}:{
    services.sonarr = {
      enable = true;
      group = "media";
      dataDir = "/var/lib/sonarr";
      environmentFiles = [config.age.secrets.sonarr_api.path];
    };
  };

  routing.services.sonarr = {
    port = 8989;
  };
}
