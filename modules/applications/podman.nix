toplevel @ {...}: {
  flake.modules.nixos.podman = {
    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = true;
        dockerSocket.enable = true;
        defaultNetwork.settings.dns_enabled = true;
      };

      oci-containers.backend = "podman";
    };
    users.groups.podman.members = [toplevel.config.flake.meta.primaryUser.username];
  };
}
