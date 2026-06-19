{ ... }:
{
  networking = {
    interfaces.enp9s0.ipv4.addresses = [
      {
        address = "192.168.1.16";
        prefixLength = 24;
      }
    ];
    networkmanager = {
      enable = true;
      dns = "none";
    };
    useDHCP = false;
    defaultGateway = "192.168.1.1";
    nameservers = [
      "192.168.1.100"
      "9.9.9.9"
      "1.1.1.1"
    ];
    nftables.enable = true;
  };
  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "prohibit-password";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
    fail2ban.enable = true;
  };
}
