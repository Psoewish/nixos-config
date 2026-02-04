{ ... }:
{
  sops.secrets = {
    "cloudflared/api" = {
      sopsFile = ./cloudflared.yaml;
      mode = "0444";
    };
    "cloudflared/credentials" = {
      sopsFile = ./cloudflared.yaml;
      mode = "0444";
    };

    "sonarr/api" = {
      sopsFile = ./sonarr.yaml;
      mode = "0444";
    };
    "radarr/api" = {
      sopsFile = ./radarr.yaml;
      mode = "0444";
    };

    "vaultwarden/smtp_password" = {
      sopsFile = ./vaultwarden.yaml;
      mode = "0444";
    };
    "vaultwarden/admin_token" = {
      sopsFile = ./vaultwarden.yaml;
      mode = "0444";
    };
  };
}
