{ ... }:
{
  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53;
      ports.http = 4000;

      upstreams.groups.default = [
        "https://1.1.1.1/dns-query"
        "https://1.0.0.1/dns-query"
      ];

      blocking = {
        denylists.ads = [
          "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
          "https://adaway.org/hosts.txt"
        ];
        clientGroupsBlock.default = [ "ads" ];
        refreshPeriod = "4h";
      };
      customDNS = {
        customTTL = "1h";
      };
      caching = {
        minTime = "5m";
        maxTime = "30m";
        prefetching = true;
      };
    };
  };
  networking.firewall = {
    allowedTCPPorts = [
      53
      4000
    ];
    allowedUDPPorts = [ 53 ];
  };
}
