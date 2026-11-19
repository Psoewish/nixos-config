{
  den.aspects.podman = {
    nixos = {
      virtualisation.podman = {
        enable = true;
        dockerSocket.enable = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };
  };
}
