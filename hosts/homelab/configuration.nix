{inputs, ...}: {
  flake.hosts.nixos.homelab = {
    system = "x86_64-linux";
    stateVersion = "26.05";
    staticIp = "192.168.1.100";
  };

  flake.modules.nixos.homelab.imports = with inputs.self.modules.nixos; [
    fish
    cli-tools
    git
    helix
    devenv

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
}
