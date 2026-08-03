{
  flake.modules.nixos.greeter = {...}: {
    services.displayManager = {
      autoLogin = {
        enable = true;
        user = "psoewish";
      };
      cosmic-greeter.enable = true;
    };
  };
}
