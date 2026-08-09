{
  flake.hosts.nixos.homelab = {
    system = "x86_64-linux";
    stateVersion = "26.05";
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
    pubKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOAKGYMNaCK17QYNwe4PUJ+6INU303baKyMqzYnpMS5R";
  };

  flake.modules.nixos.homelab = {config, ...}: {
    networking.interfaces.enp94s0.ipv4.addresses = [
      {
        address = config.hosts.homelab.staticIp;
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

    systemd.tmpfiles.settings.updateMedia = {
      "/data/media".Z = {
        user = "media";
        group = "media";
        mode = "0774";
      };
      "/data/downloads".Z = {
        user = "media";
        group = "media";
        mode = "0774";
      };
    };
  };
}
