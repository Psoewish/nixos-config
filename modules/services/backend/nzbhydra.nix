{
  flake.modules.nixos.nzbhydra = {
    services.nzbhydra2 = {
      enable = true;
    };
  };

  routing.services.nzbhydra2 = {
    aliases = ["nzbhydra"];
    port = 5076;
  };
}
