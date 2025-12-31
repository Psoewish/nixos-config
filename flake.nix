{
  description = "Psoewish's Personal Flake";

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ./hosts ];
    };

  inputs = {
    # Nix Packages
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # Lix
    lix.url = "git+https://git.lix.systems/lix-project/lix?ref=main";
    lix-module.url = "git+https://git.lix.systems/lix-project/nixos-module?ref=main";
    lix-module.inputs.nixpkgs.follows = "nixpkgs";
    lix-module.inputs.lix.follows = "lix";

    # Secrets
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # Authentik
    authentik.url = "github:nix-community/authentik-nix";
    authentik.inputs.nixpkgs.follows = "nixpkgs";

    # Flake Parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    easy-hosts.url = "github:tgirlcloud/easy-hosts";

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
