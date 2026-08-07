{
  flake.modules.generic.constants = {lib, ...}: {
    options.constants = lib.mkOption {
      type = lib.types.attrsOf lib.types.unspecified;
      default = {};
    };

    config.constants = {
      primaryUser = "psoewish";

      hosts = {
        desktop = {
          hostName = "desktop";
          staticIp = "192.168.1.16";
          system = "x86_64-linux";
          stateVersion = "25.11";
        };
        homelab = {
          hostName = "homelab";
          staticIp = "192.168.1.100";
          system = "x86_64-linux";
          stateVersion = "25.11";
        };
      };
    };
  };
}
