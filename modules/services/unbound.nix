{
  flake.modules.nixos.unbound = {hosts, ...}: {
    services.unbound = {
      enable = true;
      enableRootTrustAnchor = true;
      resolveLocalQueries = false;
      settings = {
        server = {
          port = 5335;
          prefetch = "yes";
          local-zone = [''"psoewish.com" redirect''];
          local-data = [''"psoewish.com. 3600 IN A ${hosts.homelab.staticIp}" ''];
        };
      };
    };
  };
}
