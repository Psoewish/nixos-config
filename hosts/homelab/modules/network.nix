toplevel @ {config, ...}: {
  flake.modules.nixos.homelab = {
    networking = {
      interfaces.enp94s0.ipv4.addresses = [
        {
          address = toplevel.config.hosts.nixos.homelab.staticIp;
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

      networkmanager = {
        enable = true;
        dns = "none";
      };
      useDHCP = false;
      dhcpcd.enable = false;
      nftables.enable = true;
      nameservers = [
        toplevel.config.hosts.nixos.homelab.staticIp
        "9.9.9.9"
      ];
      defaultGateway = "192.168.1.1";
    };
  };
}
