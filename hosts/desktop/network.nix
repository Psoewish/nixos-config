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
    };
    nftables.enable = true;
  };

  services.openssh = {
    enable = true;
    knownHosts = {
      "192.168.1.100" = {
        extraHostNames = [ "homelab" ];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOAKGYMNaCK17QYNwe4PUJ+6INU303baKyMqzYnpMS5R";
      };
    };
  };
}
