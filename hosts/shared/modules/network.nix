toplevel @ {config, ...}: {
  flake.modules.nixos.shared = {
    networking = {
      networkmanager = {
        enable = true;
        dns = "none";
      };
      useDHCP = false;
      dhcpcd.enable = false;
      nftables.enable = true;
      nameservers = [
        toplevel.config.flake.hosts.nixos.homelab.staticIp
        "9.9.9.9"
      ];
      defaultGateway = "192.168.1.1";
    };
  };
}
