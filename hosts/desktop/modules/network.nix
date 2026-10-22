{
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };
    useDHCP = false;
    dhcpcd.enable = false;
    nftables.enable = true;
    nameservers = ["192.168.1.100" "9.9.9.9"];
    defaultGateway = "192.168.1.1";
    interfaces.enp9s0.ipv4.addresses = [
      {
        address = "192.168.1.16";
        prefixLength = 24;
      }
    ];
  };
  systemd.services.NetworkManager-wait-online.enable = false;
}
