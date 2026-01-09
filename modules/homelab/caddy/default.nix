{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/caddy-dns/cloudflare@v0.2.2" ];
      hash = "sha256-dnhEjopeA0UiI+XVYHYpsjcEI6Y1Hacbi28hVKYQURg=";
    };
    email = "admin@psoewish.com";
    environmentFile = config.sops.secrets."cloudflared/api".path;
    globalConfig = ''
      acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
      servers {
        protocols h1 h2 h3
      }
    '';
    extraConfig = ''
      (secure_headers) {
        header Strict-Transport-Security "max-age=31536000; includeSubDomains"
        header X-Frame-Options "SAMEORIGIN"
        header X-Content-Type-Options "nosniff"
        header X-XSS-Protection "1; mode=block"
        header Referrer-Policy "strict-origin-when-cross-origin"
        header X-Forwarded-Proto "https"
      }
    '';

    virtualHosts = lib.mkMerge (
      lib.mapAttrsToList (name: cfg: {
        "${cfg.subdomain}.${config.homelab.domain}" = {
          serverAliases = cfg.aliases;
          extraConfig = ''
            import secure_headers
            reverse_proxy localhost:${toString cfg.port}
          '';
        };
      }) config.homelab.routes
    );
  };
}
