{ inputs, config, ... }:
{
  flake.colmena = {
    meta = {
      nixpkgs = import inputs.nixpkgs {
        system = builtins.head config.systems;
      };
      nodeNixpkgs = builtins.mapAttrs (_: v: v.pkgs) inputs.self.nixosConfigurations;
      nodeSpecialArgs = builtins.mapAttrs (_: v: v._module.specialArgs) inputs.self.nixosConfigurations;
    };
    homelab =
      { name, ... }:
      {
        deployment = {
          targetHost = "192.168.1.100";
          targetUser = "psoewish";
          tags = [ "server" ];
        };
        imports = inputs.self.nixosConfigurations.${name}._module.args.modules;
      };
  };
}
