{
  den.aspects.services.routing.tsdproxy = {
    nixos = {config, ...}: {
      security.nix-secrets.templates.tsdproxy = {
        path = "/var/lib/tsdproxy/config/tsdproxy.yaml";
        isSymlink = false;
        owner = "root";
        mode = "0440";
        content = ''
          defaultDNSProvider: cloudflare
          dnsProviders:
            cloudflare:
              provider: cloudflare
              apiToken: ${config.security.nix-secrets.secrets."cloudflare/api"}

          defaultTLSProvider: acme
          tlsProviders:
            acme:
              provider: acme
              email: "admin@psoewish.com"

          docker:
            local:
              host: unix:///var/run/docker.sock
              targetHostname: host.docker.internal
              defaultProxyProvider: default

          defaultProxyProvider: default
          tailscale:
            providers:
              default:
                clientId: ${config.security.nix-secrets.secrets."tsdproxy/client_id"}
                clientSecret: ${config.security.nix-secrets.secrets."tsdproxy/client_secret"}
                tags: "tag:container"
                shared: true
                hostname: "tsdproxy"
                preventDuplicates: true
                autoProvisionAcl: true
                reconcileInterval: "6h"
        '';
      };

      virtualisation.oci-containers.containers.tsdproxy = {
        image = "docker.io/almeidapaulopt/tsdproxy:dev";
        volumes = [
          "/var/lib/tsdproxy/data:/data"
          "/var/lib/tsdproxy/config:/config"
          "/var/run/docker.sock:/var/run/docker.sock"
        ];
        ports = ["8080:8080"];
        labels = {
          "tsdproxy.enable" = "true";
          "tsdproxy.domain" = "tsdproxy.psoewish.com";
        };
      };
    };
  };
}
