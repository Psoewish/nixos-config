{ ... }:
{
  networking = {
    networkmanager = {
      enable = true;
    };
    nftables.enable = true;
  };

  services.openssh = {
    enable = true;
    knownHosts = {
      homelab = {
        extraHostNames = [ "192.168.1.100" ];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOAKGYMNaCK17QYNwe4PUJ+6INU303baKyMqzYnpMS5R";
      };
    };
  };
}
