{
  flake.modules.nixos.core = {config, ...}: {
    networking = {
      networkmanager = {
        enable = true;
        dns = "none";
      };
      useDHCP = false;
      dhcpcd.enable = false;
      nftables.enable = true;
      nameservers = [
        config.hosts.homelab.staticIp
        "9.9.9.9"
      ];
      defaultGateway = "192.168.1.1";
    };
  };
}
