{ ... }:
{
  networking = {
    networkmanager = {
      enable = true;
    };
    nftables.enable = true;
  };
  environment.etc = {
    "resolv.conf".text = ''
      nameserver 192.168.1.100
      nameserver 9.9.9.9
    '';
  };
}
