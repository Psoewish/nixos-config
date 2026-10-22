{
  inputs,
  lib,
  ...
}: let
  inherit (lib) filterAttrs hasPrefix genAttrs attrNames mapAttrs;
  inherit (builtins) readDir;
in {
  flake = {
    nixosConfigurations =
      genAttrs
      (attrNames (filterAttrs (name: type: type == "directory" && !hasPrefix "_" name) (readDir ../hosts)))
      (hostname:
        inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            lib = inputs.nixpkgs.lib.extend (final: prev: let
              checkoutRoot = "/home/psoewish/nixos-config";
              storeRoot = toString inputs.self.outPath;
            in {mkSymlink = path: checkoutRoot + (prev.removePrefix storeRoot (toString path));});
          };
          modules = [
            {networking.hostName = hostname;}
            (inputs.import-tree (../hosts + "/${hostname}"))
            inputs.hjem.nixosModules.default
            {
              hjem = {
                clobberByDefault = true;
                specialArgs = {inherit inputs;};
              };
            }
          ];
        });

    deploy.nodes =
      mapAttrs (hostname: host: {
        inherit hostname;
        profiles.system = {
          user = "root";
          path = inputs.deploy-rs.lib.x86_64-linux.activate.nixos host;
        };
      })
      inputs.self.nixosConfigurations;
  };

  perSystem = {system, ...}: {
    checks = inputs.deploy-rs.lib.${system}.deployChecks inputs.self.deploy;
  };
}
