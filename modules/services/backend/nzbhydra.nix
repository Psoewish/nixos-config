{
  flake.modules.nixos.nzbhydra = {
    services.nzbhydra2 = {
      enable = true;
    };
  };

  routes.nzbhydra2 = {
    aliases = ["nzbhydra"];
    port = 5076;
  };
}
