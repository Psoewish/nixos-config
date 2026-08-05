{
  flake.modules.nixos.docker = {config, ...}: {
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
    users.groups.docker.members = [config.constants.primaryUser];
  };
}
