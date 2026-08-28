{
  flake.modules.nixos.sonarr = {config, ...}: {
    services.sonarr = {
      enable = true;
      group = "media";
      dataDir = "/var/lib/sonarr";
      environmentFiles = [config.sops.secrets."sonarr/api".path];
    };
  };

  flake.routes.sonarr = {
    port = 8989;
  };
}
