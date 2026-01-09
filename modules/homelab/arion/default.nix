{ inputs, ... }:
{
  imports = [ inputs.arion.nixosModules.arion ];
  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
        flags = [ "--all" ];
      };
    };

    arion.backend = "docker";
  };
}
