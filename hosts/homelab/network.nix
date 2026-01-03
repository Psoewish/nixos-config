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
    hosts = {
      "127.0.0.1" = [ "sso.psoewish.com" ];
    };
  };
  environment.etc = {
    "resolv.conf".text = ''
      nameserver 1.1.1.1
    '';
  };
}
