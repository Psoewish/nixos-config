{
  flake.modules.nixos.homelab = {inputs, ...}: {
    imports = with inputs.self.modules;
      (with nixos; [
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
      ])
      ++ [(generic.constants)];
  };
}
