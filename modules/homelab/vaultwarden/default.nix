{ config, ... }:
{
  services.vaultwarden = {
    enable = true;
    environmentFile = [
      config.sops.secrets."vaultwarden/admin_token".path
      config.sops.secrets."vaultwarden/smtp_password".path
    ];
    config = {
      DOMAIN = "https://vault.psoewish.com";
      SIGNUPS_ALLOWED = false;
      WEB_VAULT_ENABLED = true;
      WEBSOCKET_ENABLED = true;
      ROCKET_ADDRESS = "0.0.0.0";
      ROCKET_PORT = 8222;
      SMTP_HOST = "smtp.fastmail.com";
      SMTP_PORT = 587;
      SMTP_USERNAME = "psoewish@fastmail.com";
      SMTP_FROM = "vault@psoewish.com";
      SMTP_FROM_NAME = "Psoewish's Vaultwarden Service";
    };
  };

  homelab.routes.vaultwarden = {
    subdomain = "vault";
    port = 8222;
    public = true;
  };
}
