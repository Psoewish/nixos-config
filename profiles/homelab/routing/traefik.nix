{
  config,
  lib,
  mkRoute,
  ...
}:
lib.mkMerge [
  {
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
            email = (import ../../../secrets/soft-secrets.nix).email;
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
        accessLog = { };
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
  }
  (mkRoute {
    service = "api@internal";
    subdomain = "traefik";
    port = 80;
    public = false;
  })
]
