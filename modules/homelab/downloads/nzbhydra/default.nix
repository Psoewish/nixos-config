{ lib, ... }:
{
  imports = with lib; [
    (modules.importApply ../../../../lib/service-template.nix {
      name = "nzbhydra";
      container = {
        image = "lscr.io/linuxserver/nzbhydra2:latest";
        volumes = [
          "/var/lib/nzbhydra2:/config"
        ];
      };
      route.port = 5076;
    })
  ];
}
