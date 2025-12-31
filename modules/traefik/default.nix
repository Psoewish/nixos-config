{ config, ... }:
{
  fractal.tags = [ "homelab" ];
  services.traefik = {
    enable = true;

    staticConfigOptions = {
      entryPoints = {
        web = {
          address = ":80";
          http.redirections.entryPoint = {
            to = "websecure";
            scheme = "https";
          };
        };
        websecure = {
          address = ":443";
          http.tls.certResolver = "cloudflare";
        };
      };

      certificatesResolvers.cloudflare = {
        acme = {
          # email = "${config.sops.secrets."personal/email".path}";
          email = "psoewish@proton.me";
          storage = "/var/lib/traefik/acme.json";
          dnsChallenge = {
            provider = "cloudflare";
            resolvers = [
              "1.1.1.1:53"
              "1.0.0.1:53"
            ];
          };
        };
      };

      api = {
        dashboard = true;
        insecure = false;
      };

      log.level = "INFO";
      accessLog = {
        filePath = "/var/lib/traefik/access.log";
        format = "json";
        fields = {
          defaultMode = "keep";
          names = {
            ClientUsername = "drop";
          };
          headers = {
            defaultMode = "keep";
            names = {
              Authorization = "drop";
              Cookie = "drop";
            };
          };
        };
      };
    };

    dynamicConfigOptions.http = {
      middlewares = {
        authentik.forwardAuth = {
          address = "http://localhost:9000/outpost.goauthentik.io/auth/traefik";
          tls.insecureSkipVerify = true;
          trustForwardHeader = true;
          authResponseHeaders = [
            "X-authentik-username"
            "X-authentik-groups"
            "X-authentik-email"
            "X-authentik-name"
            "X-authentik-uid"
            "X-authentik-jwt"
            "X-authentik-meta-jwks"
            "X-authentik-meta-outpost"
            "X-authentik-meta-provider"
            "X-authentik-meta-app"
            "X-authentik-meta-version"
          ];
        };
        secure-headers.headers = {
          customRequestHeaders = {
            X-Forwarded-Proto = "https";
          };
          customResponseHeaders = {
            Strict-Transport-Security = "max-age=31536000; includeSubDomains";
            X-Frame-Options = "SAMEORIGIN";
            X-Content-Type-Options = "nosniff";
            X-XSS-Protection = "1; mode=block";
            Referrer-Policy = "strict-origin-when-cross-origin";
          };
        };
      };

      services.authentik-outpost.loadBalancer.servers = [
        { url = "http://localhost:9000"; }
      ];
    };

    environmentFiles = [ config.sops.secrets."cloudflare/api".path ];
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  systemd.services.traefik.serviceConfig = {
    StateDirectory = "traefik";
  };

  homelab.routes.traefik = {
    service = "api@internal";
    subdomain = "traefik";
    port = 80;
    public = false;
    forwardAuth = true;
  };
}
