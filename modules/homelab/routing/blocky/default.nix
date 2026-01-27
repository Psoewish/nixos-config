{ ... }:
{
  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53;
      ports.http = 4000;

      upstreams.groups.default = [
        "https://dns.quad9.net/dns-query"
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
        mapping."psoewish.com" = "192.168.1.100";
        customTTL = "1h";
      };
      caching = {
        minTime = "5m";
        maxTime = "30m";
        prefetching = true;
      };
    };
  };
}
