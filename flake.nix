{
  description = "Psoewish's Personal Flake";

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ./hosts ];
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [ sops ];
          };
        };
    };

  inputs = {
    # Nix Packages
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";

    # Secrets
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # Flake Parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

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

    arion.url = "github:hercules-ci/arion";
    arion.inputs.nixpkgs.follows = "nixpkgs";
  };
}
