{ lib, config, ... }:
{
  sops.secrets = {
    "cloudflare/domain" = {
      sopsFile = ./cloudflare.yaml;
      mode = "0444";
    };
    "cloudflare/credentials" = {
      sopsFile = ./cloudflare.yaml;
      mode = "0444";
    };
    "cloudflare/accountId" = {
      sopsFile = ./cloudflare.yaml;
      mode = "0400";
    };
    "cloudflare/tunnelId" = {
      sopsFile = ./cloudflare.yaml;
      mode = "0400";
    };
    "cloudflare/api" = {
      sopsFile = ./cloudflare.yaml;
      mode = "0400";
    };
    "sonarr/api" = {
      sopsFile = ./sonarr.yaml;
      mode = "0400";
    };
    "radarr/api" = {
      sopsFile = ./radarr.yaml;
      mode = "0400";
    };
    "crowdsec/bouncer-api-key" = {
      sopsFile = ./crowdsec.yaml;
      mode = "0400";
    };
    "crowdsec/console-enrollment-key" = {
      sopsFile = ./crowdsec.yaml;
      mode = "0400";
      owner = lib.mkIf (config.services.crowdsec.enable or false) "crowdsec";
    };
    "authentik/env" = {
      sopsFile = ./authentik.yaml;
      mode = "0400";
    };
    "matrix/registration_token" = {
      sopsFile = ./matrix.yaml;
      mode = "0400";
      owner = lib.mkIf (config.services.matrix-tuwunel.enable or false) "tuwunel";
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
  };
}
