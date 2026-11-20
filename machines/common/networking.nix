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
      tailscale = {
        enable = true;
        useRoutingFeatures = "both";
        extraSetFlags = [
          "--accept-dns"
          "--accept-routes"
          "--ssh"
        ];
      };
      resolved = {
        enable = true;
        settings.Resolve = {
          DNS = ["9.9.9.9"];
          FallbackDNS = ["192.168.1.100"];
          DNSSEC = "allow-downgrade";
        };
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
