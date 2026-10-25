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
            inputs.home-manager.nixosModules.home-manager
            ({pkgs, ...}: {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {inherit inputs;};
                backupCommand = "${pkgs.trash-cli}/bin/trash";
              };
            })
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
    checks = inputs.deploy-rs.lib."x86_64-linux".deployChecks inputs.self.deploy;
  };
}
