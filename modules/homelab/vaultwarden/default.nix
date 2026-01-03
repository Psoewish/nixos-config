{ config, ... }:
{
  services.vaultwarden = {
    enable = true;
    config = {
      domain = "vault.psoewish.com";
      signupsAllowed = false;
      rocketAddress = "127.0.0.1";
      rocketPort = 8222;
      adminToken = config.sops.secrets."vaultwarden/admin_token".path;
      smtphost = "smtp.fastmail.com";
      smtpPort = 465;
      username = "psoewish@fastmail.com";
      smtpPassword = config.sops.secrets."vaultwarden/smtp_password".path;
      smtpFrom = "vault@psoewish.com";
      smtpFromName = "Psoewish's Vaultwarden Service";
    };
  };

  homelab.routes.vaultwarden = {
    subdomain = "vault";
    port = 8222;
    public = true;
  };
}
