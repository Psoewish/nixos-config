{inputs, ...}: {
  flake.modules.nixos.greeter = {
    imports = [inputs.noctalia-greeter.nixosModules.default];
    programs.noctalia-greeter = {
      enable = true;
      settings = {
        # session.default = "";
        user.default = "psoewish";
      };
    };
  };
}
