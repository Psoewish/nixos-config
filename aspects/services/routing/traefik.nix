{
  den.aspects.services.routing.traefik = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates = {
        traefik-middlewares = {
          path = "/var/lib/traefik/config/middlewares.yaml";
          isSymlink = false;
          owner = "root";
          mode = "0440";
          content = lib.generators.toYAML {} {
            http.middlewares.security-headers.headers = {
              contentTypeNosniff = true;
              referrerPolicy = "strict-origin-when-cross-origin";
              stsIncludeSubdomains = true;
              stsPreload = true;
              stsSeconds = 31536000;
            };
          };
        };
        traefik-config = {
          path = "/var/lib/traefik/config/traefik.yaml";
          isSymlink = false;
          owner = "root";
          mode = "0440";
          content = lib.generators.toYAML {} {
            api.dashboard = true;

            providers = {
              docker.exposedByDefault = false;
              file.filename = "/etc/traefik/middlewares.yaml";
            };

            entryPoints = {
              http = {
                address = ":80";
                http.redirections.entryPoint = {
                  to = "https";
                  scheme = "https";
                };
              };
              https = {
                address = ":443";
                http = {
                  tls = {
                    certResolver = "cloudflare";
                    domains = [
                      {
                        main = "psoewish.com";
                        sans = ["*.psoewish.com"];
                      }
                    ];
                  };
                  middlewares = ["security-headers@file"];
                };
              };
            };

            certificatesResolvers = {
              cloudflare = {
                acme = {
                  email = "admin@psoewish.com";
                  storage = "/acme.json";
                  dnsChallenge = {
                    provider = "cloudflare";
                    resolvers = [
                      "1.1.1.1:53"
                      "1.0.0.1:53"
                    ];
                  };
                };
              };
            };
          };
        };
      };

      virtualisation.oci-containers.containers.traefik = {
        image = "docker.io/library/traefik:latest";
        environment = {
          CF_API_EMAIL = "admin@psoewish.com";
          CF_DNS_API_TOKEN = "${config.security.nix-secrets.secrets."cloudflare/api"}";
        };
        ports = [
          "80:80"
          "443:443"
        ];
        volumes = [
          "/var/run/docker.sock:/var/run/docker.sock:ro"
          "/var/lib/traefik/config:/etc/traefik:ro"
          "/var/lib/traefik/acme.json:/acme.json"
        ];
        labels = {
          "traefik.enable" = "true";
          "traefik.http.routers.dashboard.rule" = "Host(`traefik.psoewish.com`)";
          "traefik.http.routers.dashboard.service" = "api@internal";
        };
      };
    };
  };
}
