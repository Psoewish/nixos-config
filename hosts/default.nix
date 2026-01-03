{ inputs, ... }:
let
  lib = inputs.nixpkgs.lib;
  import-tree = inputs.import-tree;

  globalArgs = {
    inherit inputs lib;
    username = "psoewish";
  };

  globalModules =
    (with inputs; [
      home-manager.nixosModules.home-manager
      sops-nix.nixosModules.default
      unmanic-nix.nixosModules.default
    ])
    ++ (import-tree.filter (lib.hasSuffix "default.nix") [
      ../modules/settings
      ../modules/shared
      ../lib
      ../secrets
    ]).imports;
in
{
  systems = import inputs.systems;
  flake.nixosConfigurations = {
    desktop = lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = globalArgs;
      modules =
        (import-tree ./desktop).imports
        ++ globalModules
        ++ (import-tree.filter (lib.hasSuffix "default.nix") ../modules/desktop).imports;
    };
    homelab = lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = globalArgs;
      modules =
        (import-tree ./homelab).imports
        ++ globalModules
        ++ (import-tree.filter (lib.hasSuffix "default.nix") ../modules/homelab).imports;
    };
  };
}
