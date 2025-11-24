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

    # Colmena
    colmena.url = "github:zhaofengli/colmena";
    colmena.inputs.nixpkgs.follows = "nixpkgs";

    # Secrets
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # Flake Parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Stylix
    stylix.url = "github:nix-community/stylix";

    # Hyprland
    hyprland.url = "github:hyprwm/hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";

    # Noctalia
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    # Spicetify wrapper for Spotify
    spicetify-nix.url = "github:gerg-l/spicetify-nix";

    # Zen Browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    # Chaotic nyx
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # Unmanic
    unmanic-nix.url = "github:psoewish/unmanic-nix";
    unmanic-nix.inputs.nixpkgs.follows = "nixpkgs";

    # FileFlows (private repo, unfortunately)
    fileflows.url = "git+ssh://git@github.com/psoewish/fileflows-nix.git";
    fileflows.inputs.nixpkgs.follows = "nixpkgs";
  };
}
