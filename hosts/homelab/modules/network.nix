toplevel @ {config, ...}: {
  flake.modules.nixos.homelab = {
    networking = {
      interfaces.enp94s0.ipv4.addresses = [
        {
          address = toplevel.config.flake.hosts.nixos.homelab.staticIp;
          prefixLength = 24;
        }
      ];

      firewall = {
        allowedTCPPorts = [
          53
          80
          443
        ];
        allowedUDPPorts = [53];
      };
    };
  };
}
