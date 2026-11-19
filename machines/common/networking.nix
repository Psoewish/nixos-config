{
  den.aspects.common.networking.nixos = {
    host,
    config,
    lib,
    ...
  }: {
    systemd.network.wait-online.enable = false;
    boot.initrd.systemd.network.wait-online.enable = false;
    services.netbird = {
      enable = true;
      useRoutingFeatures = "both";
      clients.default = {
        login = lib.optionalAttrs (host.role == "server") {
          enable = true;
          setupKeyFile = "${config.security.nix-secrets.secrets."netbird/setup_key_server".path}";
        };
        ui.enable = host.role != "server";
        openFirewall = true;
        openInternalFirewall = true;
      };
    };

    services.resolved = {
      enable = true;
      settings.Resolve = {
        DNS = ["9.9.9.9"];
        FallbackDNS = ["192.168.1.100"];
        DNSSEC = "allow-downgrade";
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
        enable = true;
        allowedTCPPorts = lib.optionals (host.networking ? allowedTCPPorts) host.networking.allowedTCPPorts;
        allowedUDPPorts = lib.optionals (host.networking ? allowedUDPPorts) host.networking.allowedUDPPorts;
      };
    };
  };
}
