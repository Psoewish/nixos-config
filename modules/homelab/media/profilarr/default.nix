{ lib, ... }:
{
  imports = with lib; [
    (modules.importApply ../../../../lib/service-template.nix {
      name = "profilarr";
      container = {
        image = "santiagosayshey/profilarr:latest";
        volumes = [
          "/var/lib/profilarr:/config"
        ];
      };
      route.port = 6868;
    })
  ];
}
