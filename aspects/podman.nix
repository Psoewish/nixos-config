{
  den.aspects.podman = {
    nixos = {
      virtualisation = {
        podman = {
          enable = true;
          dockerCompat = true;
          dockerSocket.enable = true;
          defaultNetwork.settings.dns_enabled = true;
        };
        containers.containersConf.settings = {
          network.dns_bind_port = 5335;
          containers.default_sysctls = ["net.ipv4.ip_local_port_range=1024 65535"];
        };
      };
    };
  };
}
