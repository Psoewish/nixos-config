{ lib, ... }:
{
  imports = with lib; [
    (modules.importApply ../../../../lib/service-template.nix {
      name = "jellyfin";
      container = {
        image = "jellyfin/jellyfin:latest";
        volumes = [
          "/var/lib/jellyfin:/config"
          "/data/media/tv:/data/media/tv"
          "/data/media/movies:/data/media/movies"
        ];
        devices = [ "/dev/dri:/dev/dri" ];
      };
      route = {
        port = 8096;
        public = true;
      };
    })
  ];
}
