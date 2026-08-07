{
  flake.modules.nixos.unbound = {config, ...}: {
    services.unbound = {
      enable = true;
      enableRootTrustAnchor = true;
      resolveLocalQueries = false;
      settings = {
        server = {
          port = 5335;
          prefetch = "yes";
          local-zone = [''"${config.global.domain}" redirect''];
          local-data = [''"${config.global.domain}. 3600 IN A ${config.hosts.homelab.staticIp}" ''];
        };
      };
    };
  };
}
