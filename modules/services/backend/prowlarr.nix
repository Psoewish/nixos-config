{
  flake.modules.nixos.prowlarr = {config, ...}: {
    services.prowlarr = {
      enable = true;
      environmentFiles = [config.sops.secrets."prowlarr/api".path];
    };
  };

  flake.routes.prowlarr = {
    port = 9696;
  };
}
