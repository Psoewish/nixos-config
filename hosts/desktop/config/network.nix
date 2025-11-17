{ ... }:
{
  networking = {
    networkmanager = {
      enable = true;
    };
  };
  environment.etc = {
    "resolv.conf".text = ''
      nameserver 192.168.1.100
      nameserver 1.1.1.1
    '';
  };
}
