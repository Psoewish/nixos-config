{
  flake.modules.nixos.vaultwarden = {config, ...}: {
    virtualisation.oci-containers.containers.vaultwarden = {
      hostname = "vaultwarden";
      image = "vaultwarden/server:latest";
      pull = "always";
      environmentFiles = [
        config.age.secrets.vaultwarden_admin_token.path
        config.age.secrets.vaultwarden_smtp_password.path
      ];
      environment = {
        DOMAIN = "https://vault.${config.global.domain}";
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

    # services.caddy.virtualHosts = {
    #   "vault.${config.global.domain}" = {
    #     extraConfig = ''
    #       import security_defaults
    #       import admin_redir
    #       reverse_proxy localhost:8222
    #     '';
    #   };
    # };

    services.cloudflared.tunnels."${config.global.cloudflared.tunnelId}".ingress."vault.${config.global.domain}" = {
      service = "https://localhost:443";
      originRequest.originServerName = "vault.${config.global.domain}";
    };
  };
}
