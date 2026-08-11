{
  flake.modules.nixos.homelab = {
    age.secrets = {
      cloudflared_credentials.rekeyFile = ./cloudflared_credentials.age;
      cloudflared_api.rekeyFile = ./cloudflared_api.age;

      sonarr_api.rekeyFile = ./sonarr_api.age;
      radarr_api.rekeyFile = ./radarr_api.age;
      prowlarr_api.rekeyFile = ./prowlarr_api.age;
      sabnzbd_secrets = {
        rekeyFile = ./sabnzbd_secrets.age;
        owner = "sabnzbd";
      };

      vaultwarden_admin_token.rekeyFile = ./vaultwarden_admin_token.age;
      vaultwarden_smtp_password.rekeyFile = ./vaultwarden_smtp_password.age;
    };
  };
}
