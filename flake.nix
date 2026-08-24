{
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree.filterNot (inputs.nixpkgs.lib.hasInfix "flake.nix") ./.);

  inputs = {
    # Base stuff
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";
    direnv-instant = {
      url = "github:mic92/direnv-instant";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cachy-kernel.url = "github:xddxdd/nix-cachyos-kernel";

    # Secrets
    agenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix-rekey = {
      url = "github:oddlama/agenix-rekey";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Applications
    nixcord = {
      url = "github:4evy/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pear-desktop = {
      url = "github:h-banii/pear-desktop-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    streamcontroller = {
      url = "github:daaboulex/streamcontroller-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # umbriel.url = "git+https://github.com/noctalia-dev/umbriel";
    # xdg-desktop-portal-umbriel.url = "github:noctalia-dev/xdg-desktop-portal-umbriel";
  };
}
