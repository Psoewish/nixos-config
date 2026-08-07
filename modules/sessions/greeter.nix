{
  flake.modules.nixos.greeter = {config, ...}: {
    services.displayManager = {
      autoLogin = {
        enable = true;
        user = config.hosts.${config.networking.hostName}.primaryUser;
      };
      cosmic-greeter.enable = true;
    };
  };
}
