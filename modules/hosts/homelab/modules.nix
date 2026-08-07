{
  flake.modules.nixos.homelab = {inputs, ...}: {
    imports = with inputs.self.modules.nixos; [
      # hardware
      intelcpu
      intelgpu
      helix
      fish
      ghostty
      # theme
      catppuccin

      docker
      blocky
      unbound

      jellyfin
      jellyseerr

      sonarr
      radarr
      profilarr
      nzbhydra
      prowlarr
      sabnzbd
      transmission
    ];
  };
}
