{ ... }:
{
  sops.secrets = {
    "cloudflare/credentials" = {
      sopsFile = ./cloudflare.yaml;
      mode = "0444";
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
  };
}
