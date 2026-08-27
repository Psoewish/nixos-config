toplevel @ {config, ...}: {
  flake.modules.nixos.cloudflared = {
    config,
    lib,
    ...
  }: {
    services.cloudflared = {
      enable = true;
      tunnels."${toplevel.config.flake.metadata.tunnelId}" = {
        credentialsFile = config.age.secrets.cloudflared_credentials.path;
        default = "http_status:404";
        originRequest.noTLSVerify = true;
        ingress = lib.foldl' (acc: entries: acc // entries) {} (
          lib.mapAttrsToList (
            name: route:
              if route.public
              then
                lib.genAttrs (map (sd: "${sd}.${toplevel.config.flake.metadata.domain}") ([route.service] ++ route.aliases))
                (
                  hostname: {
                    service = "https://localhost:443";
                    originRequest.originServerName = hostname;
                  }
                )
              else {}
          )
          toplevel.config.flake.routes
        );
      };
    };
  };
}
