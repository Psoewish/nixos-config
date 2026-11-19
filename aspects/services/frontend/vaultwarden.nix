{
  den.aspects.services.frontend.vaultwarden = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates.vaultwarden.content = lib.concatLines [
        "ADMIN_TOKEN=${config.security.nix-secrets.secrets."vaultwarden/admin_token"}"
        "SMTP_PASSWORD=${config.security.nix-secrets.secrets."vaultwarden/smtp_password"}"
        "USE_SYSLOG=true"
        "EXTENDED_LOGGING=true"
        "SIGNUPS_ALLOWED=false"
        "WEB_VAULT_ENABLED=true"
        "ROCKET_ADDRESS=0.0.0.0"
        "ROCKET_PORT=8222"
        "SMTP_HOST=smtp.protonmail.ch"
        "SMTP_PORT=587"
        "SMTP_USERNAME=vault@psoewish.com"
        "SMTP_FROM=vault@psoewish.com"
        "SMTP_FROM_NAME=Psoewish's Vaultwarden Service"
      ];

      virtualisation.oci-containers.containers.vaultwarden = {
        image = "ghcr.io/dani-garcia/vaultwarden:latest";
        environmentFiles = [config.security.nix-secrets.templates.vaultwarden.path];
        volumes = ["/var/lib/vaultwarden:/data"];
      };
    };
  };
}
