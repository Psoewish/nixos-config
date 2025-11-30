{ inputs, ... }:
let
  lib = inputs.nixpkgs.lib;
  import-tree = inputs.import-tree;

  # Desktop Host Configuration
  desktopHost = import-tree [ ../hosts/desktop ];
  desktopProfiles = import-tree [
    ../modules/core
    ../modules/graphical
    ../modules/development
    ../modules/gaming
    ../secrets
  ];

  # Homelab Host Configuration
  homelabHost = import-tree [ ../hosts/homelab ];
  homelabProfiles = import-tree [
    ../modules/core
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
        inputs.chaotic.nixosModules.default
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
      ];
    };
  };
}
