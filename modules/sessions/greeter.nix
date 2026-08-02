{
  flake.modules.nixos.greeter = { pkgs, ... }: {
    services.displayManager = {
      autoLogin = {
        enable = true;
        user = "psoewish";
      };
      cosmic-greeter.enable = true;
    };
  };
}
