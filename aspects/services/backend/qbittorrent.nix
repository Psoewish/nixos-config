{
  den.aspects.services.backend.qbittorrent = {
    nixos = {
      config,
      lib,
      ...
    }: {
      security.nix-secrets.templates.qbittorrent.content = lib.concatLines [
        "PUID=1000"
        "PGID=1000"
        "TZ=${config.time.timeZone}"
        "WEBUI_PORT=8080"
        "TORRENTING_PORT=6881"
      ];

      virtualisation.oci-containers.containers.qbittorrent = {
        image = "lscr.io/linuxserver/qbittorrent:latest";
        environmentFiles = [config.security.nix-secrets.templates.qbittorrent.path];
        volumes = [
          "/var/lib/qbittorrent:/config"
          "/data/downloads/torrents:/data/downloads/torrents"
        ];
        ports = ["8181:8080"];
        labels = {
          "tsdproxy.enable" = "true";
          "tsdproxy.domain" = "qbittorrent.psoewish.com";
        };
      };
    };
  };
}
