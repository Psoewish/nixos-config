{
  den.aspects.services.frontend.vaultwarden = {
    nixos = {config, ...}: {
      services.vaultwarden = {
        enable = true;
        environmentFile = [config.sops.secrets."vaultwarden".path];
        domain = "vaultwarden.psoewish.com";
        config = {
          USE_SYSLOG = "true";
          EXTENDED_LOGGING = "true";
          SIGNUPS_ALLOWED = "false";
          WEB_VAULT_ENABLED = "true";
          ROCKET_ADDRESS = "127.0.0.1";
          ROCKET_PORT = "8222";
          SMTP_HOST = "smtp.protonmail.ch";
          SMTP_PORT = "587";
          SMTP_USERNAME = "vault@psoewish.com";
          SMTP_FROM = "vault@psoewish.com";
          SMTP_FROM_NAME = "Psoewish's Vaultwarden Service";
        };
      };
      services.traefik.dynamicConfigOptions.http = {
        routers.vaultwarden = {
          service = "vaultwarden";
          rule = "Host(`vaultwarden.psoewish.com`) || Host(`vault.psoewish.com`)";
          entryPoints = ["websecure"];
        };
        services.vaultwarden.loadBalancer.servers = ["http://localhost:8222"];
      };
    };
    services.cloudflared.tunnels."009088b8-cd7c-41fb-b25d-2d34cd98bc6e".ingress = {
      vaultwarden = {
        service = "https://localhost:443";
        originRequest.originServerName = "vaultwarden.psoewish.com";
      };

      vault = {
        service = "https://localhost:443";
        originRequest.originServerName = "vault.psoewish.com";
      };
    };
  };
}
