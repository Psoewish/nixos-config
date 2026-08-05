{
  flake.hosts.nixos.homelab = {
    system = "x86_64-linux";
    stateVersion = "25.11";
    staticIp = "192.168.1.100";
    users = {
      psoewish = {
        isPrimary = true;
        extraGroups = [
          "media"
        ];
        shell = "fish";
      };
      media = {
        id = 5000;
        extraGroups = ["video" "render"];
      };
    };
  };

  flake.modules.nixos.homelab = {hosts, ...}: {
    networking.interfaces.enp94s0.ipv4.addresses = [
      {
        address = hosts.homelab.staticIp;
        prefixLength = 24;
      }
    ];
    networking.firewall = {
      allowedTCPPorts = [
        53
        80
        443
      ];
      allowedUDPPorts = [53];
    };
    systemd.tmpfiles.rules = [
      "Z /media 0774 media media - -"
      "Z /downloads 0774 media media - -"
    ];
  };
}
