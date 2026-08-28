toplevel @ {
  inputs,
  config,
  ...
}: {
  flake.modules.nixos.greeter = {
    imports = [inputs.noctalia-greeter.nixosModules.default];
    programs.noctalia-greeter = {
      enable = true;
      settings = {
        user.default = toplevel.config.flake.metadata.primaryUser.username;
      };
    };
  };
}
