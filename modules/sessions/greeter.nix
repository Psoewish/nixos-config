toplevel @ {config, ...}: {
  flake.modules.nixos.greeter = {config, ...}: {
    services.displayManager = {
      autoLogin = {
        enable = true;
        user = toplevel.config.hosts.nixos.${config.networking.hostName}.primaryUser;
      };
      cosmic-greeter.enable = true;
    };
  };
}
