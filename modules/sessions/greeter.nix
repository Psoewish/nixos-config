toplevel @ {config, ...}: {
  flake.modules.nixos.greeter = {
    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "start-cosmic";
          user = toplevel.config.flake.meta.primaryUser.username;
        };
        default_session = initial_session;
      };
    };
  };
}
