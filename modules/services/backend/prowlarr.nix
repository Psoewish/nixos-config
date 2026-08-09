{
  flake.modules.nixos.prowlarr = {config, ...}: {
    services.prowlarr = {
      enable = true;
      environmentFiles = [config.age.secrets.prowlar_api.path];
    };
  };

  flake.routes.prowlarr = {
    port = 9696;
  };
}
