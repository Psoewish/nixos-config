{
  flake.modules.nixos.vaultwarden = {config, ...}: {
    services.vaultwarden = {
      enable = true;
      environmentFile = [
        config.age.secrets.vaultwarden_admin_token.path
        config.age.secrets.vaultwarden_smtp_password.path
      ];
      domain = "vault.${config.global.domain}";
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
        SMTP_FROM = "vault@psoewish.com";
        SMTP_FROM_NAME = "Psoewish's Vaultwarden Service";
      };
    };

    services.traefik.dynamicConfigOptions.http = let
      service = "vaultwarden";
      port = 8222;
    in {
      routers.${service} = {
        rule = "Host(`vault.${config.global.domain}`)";
        service = service;
        entryPoints = ["websecure"];
      };
      services.${service}.loadBalancer.servers = [
        {url = "http://localhost:${toString port}";}
      ];
    };

    services.cloudflared.tunnels."${config.global.cloudflared.tunnelId}".ingress."vault.${config.global.domain}" = {
      service = "https://localhost:443";
      originRequest.originServerName = "vault.${config.global.domain}";
    };
  };
}
