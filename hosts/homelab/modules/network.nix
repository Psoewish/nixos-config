{
  flake.modules.nixos.homelab = {
    networking = {
      interfaces.enp94s0.ipv4.addresses = [
        {
          address = "192.168.1.100";
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
        "192.168.1.100"
        "9.9.9.9"
      ];
      defaultGateway = "192.168.1.1";
    };
  };
}
