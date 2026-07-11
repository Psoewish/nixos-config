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
          hjem.nixosModules.default
          sops-nix.nixosModules.default
          home-manager.nixosModules.home-manager
          catppuccin.nixosModules.catppuccin
        ];
        tags = with self.nixosModules; [ secrets ];
        hosts = {
          desktop.tags = with self.nixosModules; [
            cli
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
    # Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";

    # Secrets
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    hjem.url = "github:feel-co/hjem";
    hjem.inputs.nixpkgs.follows = "nixpkgs";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Affinity
    affinity.url = "github:mrshmllow/affinity-nix";

    # catppuccin-nix
    catppuccin.url = "github:catppuccin/nix";

    # Zen Browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser-extensions.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    zen-browser-extensions.inputs.nixpkgs.follows = "nixpkgs";
  };
}
