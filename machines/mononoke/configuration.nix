{den, ...}: {
  den.hosts.mononoke = {
    system = "x86_64-linux";
    role = "server";

    theme = "soft-server";
    users.psoewish = {};

    kernel = {
      package = "linuxPackages";
      modules = ["kvm-intel"];
    };
    networking = {
      interface = "enp94s0";
      address = "192.168.1.100";
      allowedTCPPorts = [53 80 443];
      allowedUDPPorts = [53];
    };
    includes = [den.aspects.common._];
  };

  den.aspects.mononoke.includes = with den.aspects; [
    dev.git
    dev.editors.helix
    shell.fish
    podman
    nix-secrets

    services.backend.nzbhydra
    services.backend.nzbget
    services.backend.profilarr
    services.backend.prowlarr
    services.backend.radarr
    services.backend.sonarr
    services.backend.qbittorrent
    services.backend.wud

    services.frontend.vaultwarden

    # services.routing.blocky
    # services.routing.unbound
    services.routing.netbird-proxy
    services.routing.certbot
  ];
}
