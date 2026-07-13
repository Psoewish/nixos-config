{
  description = "Psoewish's Personal Flake";

  outputs =
    inputs:
    let
      lib = import ./lib { inherit inputs; };
    in
    with inputs;
    lib.fractal.mkFlake ./. {
      systems = {
        specialArgs = {
          meta = import ./meta.nix;
        };
        modules = with inputs; [
          helium.nixosModules.default
          sops-nix.nixosModules.default
          home-manager.nixosModules.home-manager
          catppuccin.nixosModules.catppuccin
        ];
        tags = with self.nixosModules; [ secrets ];
        hosts = {
          desktop.tags = with self.nixosModules; [
            shell
            core
            dev
            environment
            gaming
            graphical
            theming
          ];
          homelab.tags = with self.nixosModules; [ homelab ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    affinity.url = "github:mrshmllow/affinity-nix";
    catppuccin.url = "github:catppuccin/nix";
    helium.url = "github:oxcl/nix-flake-helium-browser";
    helium.inputs.nixpkgs.follows = "nixpkgs";
  };
}
