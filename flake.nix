{
  description = "Psoewish's Personal Flake";

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ (inputs.import-tree ./parts) ];
    };

  inputs = {
    # Nix Packages
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # Secrets
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # Authentik
    authentik.url = "github:nix-community/authentik-nix";
    authentik.inputs.nixpkgs.follows = "nixpkgs";

    # Flake Parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Themes
    catppuccin.url = "github:catppuccin/nix";

    # Hyprland
    hyprland.url = "github:hyprwm/hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";

    # Spicetify wrapper for Spotify
    spicetify-nix.url = "github:gerg-l/spicetify-nix";

    # Zen Browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser-extensions.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    zen-browser-extensions.inputs.nixpkgs.follows = "nixpkgs";

    # Affinity
    affinity.url = "github:mrshmllow/affinity-nix";

    # Unmanic
    unmanic-nix.url = "github:psoewish/unmanic-nix";
    unmanic-nix.inputs.nixpkgs.follows = "nixpkgs";
  };
}
