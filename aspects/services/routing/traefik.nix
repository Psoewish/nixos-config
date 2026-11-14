{
  den.aspects.services.routing.traefik = {
    nixos = {config, ...}: {
      services.traefik = {
        enable = true;
        environmentFiles = [config.sops.secrets."cloudflared/api".path];

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
              forwardedHeaders.trustedIPs = [
                "127.0.0.1/32"
                "::1/128"
                "10.0.0.0/8"
                "172.16.0.0/12"
                "192.168.0.0/16"
                "fd00::/8"
              ];
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
                middlewares = ["secure-headers" "xff-to-xrealip" "compression"];
              };
            };
          };

          certificatesResolvers.cloudflare = {
            acme = {
              email = "admin@psoewish.com";
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

          experimental.plugins.traefik-xff-to-xrealip = {
            moduleName = "github.com/jeppestaerk/traefik-xff-to-xrealip";
            version = "v0.1.3";
          };

          log = {
            level = "DEBUG";
            filePath = "${config.services.traefik.dataDir}/traefik.log";
            format = "json";
          };
        };

        dynamicConfigOptions.http = {
          middlewares = {
            secure-headers.headers = {
              stsSeconds = 31536000;
              stsIncludeSubdomains = true;
              customFrameOptionsValue = "SAMEORIGIN";
              contentTypeNosniff = true;
              browserXssFilter = true;
              referrerPolicy = "strict-origin-when-cross-origin";
              customResponseHeaders.X-Robots-Tag = "noindex, nofollow";
            };
            xff-to-xrealip.plugin.traefik-xff-to-xrealip = {};
            compression.compress.encodings = ["zstd" "gzip"];
          };
        };
      };
    };
  };
}
