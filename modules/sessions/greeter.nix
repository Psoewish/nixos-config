toplevel @ {
  config,
  inputs,
  ...
}: {
  flake.modules.nixos.greeter = {config, ...}: {
    imports = [inputs.noctalia-greeter.nixosModules.default];
    programs.noctalia-greeter = {
      enable = true;
      settings = {
        # session.default = "";
        user.default = toplevel.config.hosts.nixos.${config.networking.hostName}.primaryUser;
      };
    };
  };
}
