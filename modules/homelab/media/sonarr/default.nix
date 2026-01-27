{ lib, ... }:
{
  imports = with lib; [
    (modules.importApply ../../../../lib/service-template.nix {
      name = "sonarr";
      container = {
        image = "lscr.io/linuxserver/sonarr:latest";
        volumes = [
          "/var/lib/sonarr:/config"
          "/data/media/tv:/tv"
          "/data/downloads/usenet:/downloads/usenet"
          "/data/downloads/torrents:/downloads/torrents"
        ];
      };
      route.port = 8989;
    })
  ];
}
