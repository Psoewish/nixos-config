toplevel@{config,...}:{
  flake.modules.nixos.traefik = {
    config,
    lib,
    ...
  }: {
    services.traefik = {
      enable = true;
      environmentFiles = [config.age.secrets.cloudflared_api.path];

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
                    main = "${config.global.domain}";
                    sans = ["*.${config.global.domain}"];
                  }
                ];
              };
              middlewares = ["secure-headers" "xff-to-xrealip" "compression"];
            };
          };
        };

        certificatesResolvers.cloudflare = {
          acme = {
            email = config.global.admin.email;
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
        routers =
          lib.mapAttrs (name: route: {
            inherit (route) service;
            rule = lib.concatStringsSep " || " (
              map (sd: "Host(`${sd}.${toplevel.config.routing.domain}`)") ([route.service] ++ route.aliases)
            );
            entryPoints = ["websecure"];
          })
          toplevel.config.routing.services;

        services =
          lib.mapAttrs (name: route: {
            loadBalancer.servers = [{url = "http://localhost:${toString route.port}";}];
          })
          toplevel.config.routing.services;

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
}
