{inputs, ...}: {
  flake.modules.nixos.homelab = {
    imports = [inputs.sops-nix.nixosModules.sops];
    sops.defaultSopsFormat = "json";
    sops.secrets = {
      "cloudflared/api".sopsFile = ./cloudflared.json;
      "cloudflared/credentials".sopsFile = ./cloudflared.json;
      "prowlarr/api".sopsFile = ./prowlarr.json;
      "radarr/api".sopsFile = ./radarr.json;
      "sonarr/api".sopsFile = ./sonarr.json;
      "vaultwarden/admin_token".sopsFile = ./vaultwarden.json;
      "vaultwarden/smtp_password".sopsFile = ./vaultwarden.json;
      "sabnzbd" = {
        sopsFile = ./sabnzbd.ini;
        format = "ini";
        owner = "sabnzbd";
      };
    };
  };
}
