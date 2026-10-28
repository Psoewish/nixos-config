{
  inputs,
  lib,
  ...
}: let
  inherit (lib) filterAttrs hasPrefix hasSuffix genAttrs attrNames nameValuePair removeSuffix mapAttrs';
  inherit (builtins) readDir;
in {
  systems = ["x86_64-linux"];

  imports = [
    inputs.flake-parts.flakeModules.modules
    inputs.treefmt-nix.flakeModule
  ];

  flake.nixosConfigurations =
    genAttrs
    (attrNames (filterAttrs (name: type: type == "directory" && !hasPrefix "_" name) (readDir ./hosts)))
    (hostname:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          {networking.hostName = hostname;}
          (inputs.import-tree (./hosts + "/${hostname}"))
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

  flake.modules.nixos = mapAttrs' (name: type:
    if type == "directory"
    then nameValuePair name (inputs.import-tree (./modules + "/${name}"))
    else nameValuePair (removeSuffix ".nix" name) (./modules + "/${name}"))
  (filterAttrs (name: type: !hasPrefix "_" name && (type == "directory" || hasSuffix ".nix" name)) (readDir ./modules));

  perSystem.treefmt.programs = {
    alejandra.enable = true;
    deadnix.enable = true;
  };
}
