{
  flake.modules.nixos.radarr = {config, ...}: {
    services.radarr = {
      enable = true;
      group = "media";
      dataDir = "/var/lib/radarr";
      environmentFiles = [config.sops.secrets."radarr/api".path];
    };
  };

  flake.routes.radarr = {
    port = 7878;
  };
}
