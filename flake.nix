{
  description = "Psoewish's Personal Flake";

  outputs = inputs: let
    lib = import ./lib inputs;
  in
    with inputs.self.nixosModules;
      lib.fractal.mkFlake ./. {
        systems.specialArgs.meta = import ./meta.nix;
        systems.hosts = {
          desktop.tags = [
            core
            environment
            theming
            secrets
          ];
          homelab.tags = [
            core
            secrets
            services
            environment.dev.helix
          ];
        };
      };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    kineticwe.url = "gitlab:theblackdon/kineticwe";
    kineticwe.inputs.nixpkgs.follows = "nixpkgs";
    noctalia.url = "github:noctalia-dev/noctalia";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    helium.url = "github:oxcl/nix-flake-helium-browser";
    helium.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";
    xcaddy-nix.url = "github:michailik/nix-caddy-withplugins";
  };
}
