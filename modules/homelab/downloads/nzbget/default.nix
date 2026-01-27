{ lib, ... }:
{
  imports = with lib; [
    (modules.importApply ../../../../lib/service-template.nix {
      name = "nzbget";
      container = {
        image = "lscr.io/linuxserver/nzbget:latest";
        volumes = [
          "/var/lib/nzbget:/config"
          "/data/downloads/usenet:/downloads/usenet"
        ];
      };
      route.port = 6789;
    })
  ];
}
