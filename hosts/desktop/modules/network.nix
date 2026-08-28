toplevel @ {config, ...}: {
  flake.modules.nixos.desktop = {
    networking = {
      interfaces.enp9s0.ipv4.addresses = [
        {
          address = toplevel.config.flake.hosts.nixos.desktop.staticIp;
          prefixLength = 24;
        }
      ];
    };
  };
}
