toplevel @ {config, ...}: {
  flake.modules.nixos.greeter = {
    services.displayManager = {
      gdm.enable = true;
      autoLogin = {
        enable = true;
        user = toplevel.config.flake.meta.primaryUser.username;
      };
    };
    # services.greetd = {
    #   enable = true;
    #   settings = rec {
    #     initial_session = {
    #       command = "start-cosmic";
    #       user = toplevel.config.flake.meta.primaryUser.username;
    #     };
    #     default_session = initial_session;
    #   };
    # };
  };
}
