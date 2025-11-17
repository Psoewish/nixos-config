{ inputs, ... }:
let
  lib = inputs.nixpkgs.lib;
  import-tree = inputs.import-tree;
  mkRoute = import ../lib/mkRoute.nix { inherit lib; };

  # Desktop Host Configuration
  desktopHost = import-tree [ ../hosts/desktop ];
  desktopProfiles = import-tree [
    ../profiles/core
    ../profiles/graphical
    ../profiles/development
    ../profiles/gaming
  ];

  # Homelab Host Configuration
  homelabHost = import-tree [ ../hosts/homelab ];
  homelabProfiles = import-tree [
    ../profiles/core
    ../profiles/homelab
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
        ../secrets/secrets.nix
        desktopHost
        desktopProfiles
        inputs.home-manager.nixosModules.home-manager
        inputs.chaotic.nixosModules.default
        inputs.sops-nix.nixosModules.default
      ];
    };
    homelab = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs lib mkRoute;
        hostname = "homelab";
        username = "psoewish";
        stateVersion = "25.11";
      };
      modules = [
        ../secrets/secrets.nix
        homelabHost
        homelabProfiles
        inputs.home-manager.nixosModules.home-manager
        inputs.sops-nix.nixosModules.default
      ];
    };
  };
}
