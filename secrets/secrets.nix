{ inputs, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.default ];
  sops.secrets = {
    "email" = {
      sopsFile = ./personal.yaml;
      mode = "0444";
    };
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
  };
}
