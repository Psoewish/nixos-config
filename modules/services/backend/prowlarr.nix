{
  flake.modules.nixos.prowlarr = {
    services.prowlarr = {
      enable = true;
    };
  };

  flake.routes.prowlarr = {
    port = 9696;
  };
}
