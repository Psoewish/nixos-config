{ inputs, ... }:
let
  lib = inputs.nixpkgs.lib;
  import-tree = inputs.import-tree;
  meta = import ../lib/meta.nix;

  globalArgs = {
    inherit inputs lib meta;
    username = meta.personal.username;
  };

  globalModules = (with inputs; [ sops-nix.nixosModules.default ]) ++ [
    ../lib/route-options.nix
    ../secrets/secrets.nix
  ];

  desktopModules =
    (with inputs; [
      home-manager.nixosModules.home-manager
    ])
    ++ (import-tree.filter (lib.hasSuffix "default.nix") ../modules/desktop/system).imports;

  homelabModules = (import-tree.filter (lib.hasSuffix "default.nix") ../modules/homelab).imports;
in
{
  systems = import inputs.systems;
  flake.nixosConfigurations = {
    desktop = lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = globalArgs;
      modules = (import-tree ./desktop).imports ++ globalModules ++ desktopModules;
    };
    homelab = lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = globalArgs;
      modules = (import-tree ./homelab).imports ++ globalModules ++ homelabModules;
    };
  };
}
