toplevel @ {config, ...}: {
  flake.modules.nixos.desktop = {
    networking = {
      interfaces.enp9s0.ipv4.addresses = [
        {
          address = toplevel.config.hosts.nixos.desktop.staticIp;
          prefixLength = 24;
        }
      ];
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
