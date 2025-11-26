{ inputs, ... }:
let
  lib = inputs.nixpkgs.lib;
  import-tree = inputs.import-tree;

  # Import soft secrets from local file
  # NOTE: This file is gitignored but must be added to git index with:
  #   git add -f secrets/soft-secrets.nix
  # This makes it visible to Nix evaluation without committing it
  softSecrets = import ../secrets/soft-secrets.nix;

  # Create mkRoute with secrets baked in
  mkRoute = import ../lib/mkRoute.nix {
    inherit lib;
    routingSecrets = softSecrets;
  };

  # Desktop Host Configuration
  desktopHost = import-tree [ ../hosts/desktop ];
  desktopProfiles = import-tree [
    ../profiles/core
    ../profiles/graphical
    ../profiles/development
    ../profiles/gaming
    ../secrets/secrets.nix
  ];

  # Homelab Host Configuration
  homelabHost = import-tree [ ../hosts/homelab ];
  homelabProfiles = import-tree [
    ../profiles/core
    ../profiles/homelab
    ../secrets/secrets.nix
  ];
in
{
  systems = [ "x86_64-linux" ];

  flake.nixosConfigurations = {
    desktop = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs lib softSecrets;
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
        inherit
          inputs
          lib
          mkRoute
          softSecrets
          ;
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
