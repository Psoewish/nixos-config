{ lib, config, ... }:
{
  sops.secrets = {
    "cloudflared/api" = {
      sopsFile = ./cloudflared.yaml;
      mode = "0444";
      # owner = lib.mkIf (lib.attrByPath [ "services" "cloudflared" "enable" ] false config) "cloudflared";
    };
    "cloudflared/credentials" = {
      sopsFile = ./cloudflared.yaml;
      mode = "0444";
      # owner = lib.mkIf (lib.attrByPath [ "services" "cloudflared" "enable" ] false config) "cloudflared";
    };
    "sonarr/api" = {
      sopsFile = ./sonarr.yaml;
      mode = "0444";
      # owner = lib.mkIf (lib.attrByPath [ "services" "sonarr" "enable" ] false config) "sonarr";
    };
    "radarr/api" = {
      sopsFile = ./radarr.yaml;
      mode = "0444";
      # owner = lib.mkIf (lib.attrByPath [ "services" "radarr" "enable" ] false config) "radarr";
    };
    "vaultwarden/smtp_password" = {
      sopsFile = ./vaultwarden.yaml;
      mode = "0444";
      # owner = lib.mkIf (lib.attrByPath [ "services" "vaultwarden" "enable" ] false config) "vaultwarden";
    };
    "vaultwarden/admin_token" = {
      sopsFile = ./vaultwarden.yaml;
      mode = "0444";
      # owner = lib.mkIf (lib.attrByPath [ "services" "vaultwarden" "enable" ] false config) "vaultwarden";
    };
    "sabnzbd/api_key" = {
      sopsFile = ./sabnzbd.yaml;
      mode = "0444";
    };
    "sabnzbd/nzb_key" = {
      sopsFile = ./sabnzbd.yaml;
      mode = "0444";
    };
    "sabnzbd/eweka/username" = {
      sopsFile = ./sabnzbd.yaml;
      mode = "0444";
    };
    "sabnzbd/eweka/password" = {
      sopsFile = ./sabnzbd.yaml;
      mode = "0444";
    };
  };
}
