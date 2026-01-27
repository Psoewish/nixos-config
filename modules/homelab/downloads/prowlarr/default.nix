{ lib, ... }:
{
  imports = with lib; [
    (modules.importApply ../../../../lib/service-template.nix {
      name = "prowlarr";
      container = {
        image = "lscr.io/linuxserver/prowlarr:latest";
        volumes = [
          "/var/lib/prowlarr:/config"
        ];
      };
      route.port = 9696;
    })
  ];
}
