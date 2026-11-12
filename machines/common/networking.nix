{
  den.aspects.common.networking.nixos = {
    host,
    lib,
    ...
  }: {
    networking = {
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
      interfaces.${host.networking.interface}.ipv4.addresses = [
        {
          address = host.networking.address;
          prefixLength = 24;
        }
      ];
      firewall = {
        allowedTCPPorts = lib.optional (host.networking ? allowedDCPPorts) host.networking.allowedTCPPorts;
        allowedUDPPorts = lib.optional (host.networking ? allowedUDPPorts) host.networking.allowedUDPPorts;
      };
    };
  };
}
