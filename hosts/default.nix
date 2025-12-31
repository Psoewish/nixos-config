{ inputs, ... }:
let
  lib = inputs.nixpkgs.lib;
  tagDiscovery = import ../lib/buildTagMap { inherit lib; };
  tagMap = tagDiscovery.scanDirectory ../.;

  globalArgs = {
    inherit inputs lib;
    username = "psoewish";
  };
in
{
  imports = [ inputs.easy-hosts.flakeModule ];
  systems = [ "x86_64-linux" ];

  easy-hosts = {
    shared.modules = [
      ../lib/meta
      ../lib/mkRoute
    ]
    ++ (with inputs; [
      # self.nixosModules.overlays
      home-manager.nixosModules.home-manager
      sops-nix.nixosModules.default
      lix-module.nixosModules.default
      authentik.nixosModules.default
      unmanic-nix.nixosModules.default
    ]);

    hosts = {
      desktop = {
        arch = "x86_64";
        class = "nixos";
        path = ./desktop;
        specialArgs = globalArgs;
        tags = [
          "core"
          "secrets"
          "overlays"
          "desktop"
        ];
      };
      homelab = {
        arch = "x86_64";
        class = "nixos";
        path = ./homelab;
        specialArgs = globalArgs;
        tags = [
          "core"
          "secrets"
          "overlays"
          "homelab"
        ];
      };
    };
    perTag = tag: {
      modules = tagMap.${tag} or [ ];
    };
  };

  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [ sops ];
      };
    };
}
