{
  flake.modules.nixos.homelab = {inputs, ...}: {
    imports = with inputs.self.modules.nixos; [
      # hardware
      helix
      fish
      cli-tools
      git

      docker

      blocky
      cloudflared
      traefik
      unbound

      jellyfin
      jellyseerr
      vaultwarden

      nzbhydra
      profilarr
      prowlarr
      radarr
      sabnzbd
      sonarr
      transmission
    ];
  };
}
