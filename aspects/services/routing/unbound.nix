{
  den.aspects.services.routing.unbound = {
    nixos = {
      services.unbound = {
        enable = true;
        enableRootTrustAnchor = true;
        resolveLocalQueries = false;
        settings.server = {
          port = 5335;
          prefetch = "yes";
        };
      };
    };
  };
}
