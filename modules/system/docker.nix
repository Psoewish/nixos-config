toplevel @ {config, ...}: {
  flake.modules.nixos.docker = {
    virtualisation = {
      docker = {
        enable = true;
        autoPrune = {
          enable = true;
          dates = "weekly";
          flags = ["--all"];
        };
      };

      oci-containers.backend = "docker";
    };
    users.groups.docker.members = [toplevel.config.global.primaryUser];
  };
}
