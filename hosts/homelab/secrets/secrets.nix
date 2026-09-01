{inputs, ...}: {
  flake.modules.nixos.homelab = {
    imports = [inputs.sops-nix.nixosModules.sops];
    sops.secrets = {
      "cloudflared/api".sopsFile = ./cloudflared.yaml;
      "cloudflared/credentials".sopsFile = ./cloudflared.yaml;
      "prowlarr/api".sopsFile = ./prowlarr.yaml;
      "radarr/api".sopsFile = ./radarr.yaml;
      "sonarr/api".sopsFile = ./sonarr.yaml;
      "vaultwarden" = {
        sopsFile = ./vaultwarden.ini;
        format = "ini";
      };
      "sabnzbd" = {
        sopsFile = ./sabnzbd.ini;
        format = "ini";
        owner = "sabnzbd";
      };
    };
  };
}
