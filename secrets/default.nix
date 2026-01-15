{ lib, config, ... }:
{
  sops.secrets = {
    "sonarr/api" = {
      sopsFile = ./sonarr.yaml;
      mode = "0400";
    };
    "radarr/api" = {
      sopsFile = ./radarr.yaml;
      mode = "0400";
    };
    "mydia/secretKeyBase" = {
      sopsFile = ./mydia.yaml;
      mode = "0400";
      owner = lib.mkIf (config.services.mydia.enble or false) "mydia";
    };
    "vaultwarden/smtp_password" = {
      sopsFile = ./vaultwarden.yaml;
      mode = "0400";
      owner = lib.mkIf (config.services.vaultwarden.enable or false) "vaultwarden";
    };
    "vaultwarden/admin_token" = {
      sopsFile = ./vaultwarden.yaml;
      mode = "0400";
      owner = lib.mkIf (config.services.vaultwarden.enable or false) "vaultwarden";
    };

    "cloudflared/api" = {
      sopsFile = ./cloudflared.yaml;
      mode = "0400";
    };
    "cloudflared/credentials" = {
      sopsFile = ./cloudflared.yaml;
      mode = "0400";
    };
  };
}
