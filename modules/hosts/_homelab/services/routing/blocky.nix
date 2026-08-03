{...}: {
  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53;
      ports.http = 4000;

      upstreams.groups.default = ["127.0.0.1:5335"];

      blocking = {
        denylists.ads = [
          "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
          "https://adaway.org/hosts.txt"
        ];
        clientGroupsBlock.default = ["ads"];
        refreshPeriod = "4h";
      };
    };
  };
}
