{ lib, ... }:
{
  imports = with lib; [
    (modules.importApply ../../../../lib/service-template.nix {
      name = "qbittorrent";
      container = {
        image = "lscr.io/linuxserver/qbittorrent:latest";
        volumes = [
          "/var/lib/qbittorrent:/config"
          "/data/downloads/torrents:/downloads/torrents"
        ];
      };
      route.port = 8080;
    })
  ];
}
