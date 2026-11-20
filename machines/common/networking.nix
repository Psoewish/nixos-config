{
  den.aspects.common.networking.nixos = {
    host,
    config,
    ...
  }: {
    systemd.network.wait-online.enable = false;
    boot.initrd.systemd.network.wait-online.enable = false;

    systemd.services.tailscaled.serviceConfig.Environment = ["TS_DEBUG_FIREWALL_MODE=nftables"];
    services = {
      resolved.enable = true;
      tailscale = {
        enable = true;
        useRoutingFeatures = "both";
        extraSetFlags = [
          "--accept-dns"
          "--accept-routes"
          "--ssh"
        ];
      };
    };
    networking = {
      networkmanager.enable = true;
      useDHCP = false;
      dhcpcd.enable = false;
      nftables.enable = true;
      defaultGateway = "192.168.1.1";
      interfaces.${host.networking.interface}.ipv4.addresses = [
        {
          address = host.networking.address;
          prefixLength = 24;
        }
      ];
      firewall = {
        enable = false;
        trustedInterfaces = [config.services.tailscale.interfaceName];
        allowedUDPPorts = [config.services.tailscale.port];
      };
    };
  };
}
