{
  den.aspects.services.routing.certbot = {
    nixos = {
      config,
      lib,
      pkgs,
      ...
    }: let
      certbotDeployHook = pkgs.writeText "certbotDeployHook" ''
        #!/bin/sh
        set -eu
        install -m 0640 "$RENEWED_LINEAGE/privkey.pem" /certs/tls.key.new
        install -m 0644 "$RENEWED_LINEAGE/fullchain.pem" /certs/tls.crt.new
        mv -f /certs/tls.key.new /certs/tls.key
        mv -f /certs/tls.crt.new /certs/tls.crt
      '';
    in {
      security.nix-secrets.templates.certbot.content = lib.concatLines [
        "PUID=1000"
        "PGID=1000"
        "CLOUDFLARE_API_TOKEN=${config.security.nix-secrets.secrets."cloudflare/api"}"
        "CERTBOT_EMAIL=admin@psoewish.com"
        "CERTBOT_DOMAINS=psoewish.com,*.psoewish.com"
        "CERTBOT_DEPLOY_HOOK=/bin/sh /hooks/deploy-certificate"
      ];

      virtualisation.oci-containers.containers.certbot = {
        image = "docker.io/serversideup/certbot-dns-cloudflare";
        environmentFiles = [config.security.nix-secrets.templates.certbot.path];
        volumes = [
          "/var/lib/certbot:/etc/letsencrypt"
          "/var/lib/certbot/certs:/certs"
          "${certbotDeployHook}:/hooks/deploy-certificate:ro"
        ];
      };
    };
  };
}
