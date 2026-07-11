{ ... }:
{
  networking.interfaces.enp9s0.ipv4.addresses = [
    {
      address = "192.168.1.16";
      prefixLength = 24;
    }
  ];
}
