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
    globalConfig = /* Caddyfile */ ''
      acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}

      servers {
        protocols h1 h2 h3
        trusted_proxies static private_ranges
        client_ip_headers CF-Connecting-IP X-Forwarded-For X-Real-IP
      }

    '';
    extraConfig = ''
      (security_defaults) {
        encode zstd gzip

        header / {
          Strict-Transport-Security "max-age=31536000; includeSubDomains"
          X-Frame-Options "SAMEORIGIN"
          X-Content-Type-Options "nosniff"
          X-Robots-Tag "noindex, nofollow"
          X-XSS-Protection "1; mode=block"
          Referrer-Policy "strict-origin-when-cross-origin"
          X-Forwarded-Proto "https"
        }
      }

      (admin_redir) {
        @admin {
          path /admin*
          not remote_ip private_ranges
        }
        redir @admin /
      }
    '';

    virtualHosts = lib.mkMerge (
      lib.mapAttrsToList (name: cfg: {
        "${cfg.subdomain}.${config.homelab.domain}" = {
          serverAliases = cfg.aliases;
          extraConfig = ''
            import security_defaults
            import admin_redir
            reverse_proxy localhost:${toString cfg.port}
          '';
        };
      }) config.homelab.routes
    );
  };
}
