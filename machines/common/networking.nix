{
  den.aspects.common.networking.nixos = {config, ...}: {
    systemd.services.tailscaled.serviceConfig.Environment = ["TS_DEBUG_FIREWALL_MODE=nftables"];
    services = {
      resolved = {
        enable = true;
        settings.Resolve = {
          DNSStubListener = "no";
          DNS = "127.0.0.1";
        };
      };
      tailscale = {
        enable = true;
        useRoutingFeatures = "both";
        extraSetFlags = [
          "--accept-dns"
          "--accept-routes"
          "--ssh"
          "--snat-subnet-routes=false"
        ];
      };
    };
    networking = {
      networkmanager.enable = true;
      nftables.enable = true;
      firewall = {
        enable = false;
        trustedInterfaces = [config.services.tailscale.interfaceName];
        allowedUDPPorts = [config.services.tailscale.port];
      };
    };
  };
}
