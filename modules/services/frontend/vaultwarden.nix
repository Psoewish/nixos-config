toplevel@{config,...}:{
  flake.modules.nixos.vaultwarden = {config, ...}: {
    services.vaultwarden = {
      enable = true;
      environmentFile = [
        config.age.secrets.vaultwarden_admin_token.path
        config.age.secrets.vaultwarden_smtp_password.path
      ];
      domain = "vaultwarden.${toplevel.config.routing.domain}";
      config = {
        USE_SYSLOG = "true";
        EXTENDED_LOGGING = "true";
        SIGNUPS_ALLOWED = "false";
        WEB_VAULT_ENABLED = "true";
        ROCKET_ADDRESS = "127.0.0.1";
        ROCKET_PORT = "8222";
        SMTP_HOST = "smtp.fastmail.com";
        SMTP_PORT = "587";
        SMTP_USERNAME = "psoewish@fastmail.com";
        SMTP_FROM = "vault@${toplevel.config.routing.domain}";
        SMTP_FROM_NAME = "Psoewish's Vaultwarden Service";
      };
    };
  };

  routing.services.vaultwarden = {
    aliases = ["vault"];
    port = 8222;
    public = true;
  };
}
