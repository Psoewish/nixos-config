{ ... }:
{
  networking = {
    interfaces.enp94s0.ipv4.addresses = [
      {
        address = "192.168.1.100";
        prefixLength = 24;
      }
    ];
    defaultGateway = "192.168.1.1";
    useDHCP = false;
    nftables.enable = true;
    firewall = {
      allowedTCPPorts = [
        53
        80
        443
      ];
      allowedUDPPorts = [ 53 ];
    };
  };

  environment.etc = {
    "resolv.conf".text = ''
      nameserver 9.9.9.9
      nameserver 1.1.1.1
    '';
  };
}
