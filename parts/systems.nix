{ inputs, ... }:
let
  lib = inputs.nixpkgs.lib;
  import-tree = inputs.import-tree;

  # Desktop Host Configuration
  desktopHost = import-tree [ ../hosts/desktop ];
  desktopProfiles = import-tree [
    ../lib
    ../modules/shared
    ../modules/desktop
    ../secrets
  ];

  # Homelab Host Configuration
  homelabHost = import-tree [ ../hosts/homelab ];
  homelabProfiles = import-tree [
    ../lib
    ../modules/shared
    ../modules/homelab
    ../secrets
  ];
in
{
  systems = [ "x86_64-linux" ];

  flake.nixosConfigurations = {
    desktop = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs lib;
        hostname = "desktop";
        username = "psoewish";
        stateVersion = "25.05";
      };
      modules = [
        desktopHost
        desktopProfiles
        inputs.self.nixosModules.overrides
        inputs.self.nixosModules.overlays
        inputs.lix-module.nixosModules.default
      ];
    };
    homelab = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs lib;
        hostname = "homelab";
        username = "psoewish";
        stateVersion = "25.11";
      };
      modules = [
        homelabHost
        homelabProfiles
        inputs.self.nixosModules.overrides
        inputs.self.nixosModules.overlays
        inputs.lix-module.nixosModules.default
      ];
    };
  };
}
