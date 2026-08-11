{
  flake.modules.nixos.cloudflared = {
    config,
    lib,
    ...
  }: {
    services.cloudflared = {
      enable = true;
      tunnels."${config.global.cloudflared.tunnelId}" = {
        credentialsFile = config.age.secrets.cloudflared_credentials.path;
        default = "http_status:404";
        originRequest.noTLSVerify = true;
        ingress = lib.foldl' (acc: entries: acc // entries) {} (
          lib.mapAttrsToList (
            name: route:
              if route.public
              then
                lib.genAttrs (map (sd: "${sd}.${config.global.domain}") ([route.service] ++ route.aliases))
                (
                  hostname: {
                    service = "https://localhost:443";
                    originRequest.originServerName = hostname;
                  }
                )
              else {}
          )
          config.routes
        );
      };
    };
  };
}
