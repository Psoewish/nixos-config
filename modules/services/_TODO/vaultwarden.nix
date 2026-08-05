{
  flake.modules.nixos.vaultwarden = {config, ...}: {
    virtualisation.oci-containers.containers.vaultwarden = {
      name = "vaultwarden";
      container = {
        image = "vaultwarden/server:latest";
        pull = "always";

        environmentFiles = [
          config.sops.secrets."vaultwarden/admin_token".path
          config.sops.secrets."vaultwarden/smtp_password".path
        ];
        environment = {
          DOMAIN = "https://vault.psoewish.com";
          SIGNUPS_ALLOWED = "false";
          WEB_VAULT_ENABLED = "true";
          ROCKET_PORT = "8222";
          SMTP_HOST = "smtp.fastmail.com";
          SMTP_PORT = "587";
          SMTP_USERNAME = "psoewish@fastmail.com";
          SMTP_FROM = "vault@psoewish.com";
          SMTP_FROM_NAME = "Psoewish's Vaultwarden Service";
        };
        volumes = [
          "/var/lib/vaultwarden:/data"
        ];
        extraOptions = ["--network=host"];
      };
    };

    services.caddy.virtualHosts = {
      "vault.psoewish.com" = {
        extraConfig = ''
          import security_defaults
          import admin_redir
          reverse_proxy localhost:8222
        '';
      };
    };

    services.cloudflared.tunnels."009088b8-cd7c-41fb-b25d-2d34cd98bc6e".ingress."vault.psoewish.com" = {
      service = "https://localhost:443";
      originRequest.originServerName = "vault.psoewish.com";
    };
  };
}
